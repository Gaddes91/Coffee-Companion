//
//  ViewController.swift
//  Coffee Companion
//
//  Created by Matthew Gaddes on 28/12/2015.
//  Copyright © 2015 Matthew Gaddes. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UIScrollViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var intensityLabel: UILabel!
//    @IBOutlet weak var sizeLabel: UILabel!
//    @IBOutlet weak var aromaLabel: UILabel!
//    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet weak var quantityRemaining: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    
    let model = Model()
    
    // TODO: The below value may have to be changed to ensure currentPage remains the same when user closes and re-opens the app
    var currentPage = 0 // When app is first run, "currentPage" will be 0. This matches the value of "page", as calculated in func loadVisiblePages()
    var currentPickerCategory: [Coffee] = [] // This is given an initial value in func viewDidLoad()
    
    @IBAction func addSleeve(sender: UIButton)
    {
        // Update value within model itself (not just the label.text)
        currentPickerCategory[currentPage].quantity = currentPickerCategory[currentPage].quantity + 10

        saveSelectedCoffee() // TODO: Delete if application crashes!
        
        // Update label to show current value
        updateQuantityRemainingLabel()
    }
    
    @IBAction func removePod(sender: UIButton)
    {
        let num = currentPickerCategory[currentPage].quantity
        
        if num > 0 {
            // Update value within model itself (not just the label.text)
            currentPickerCategory[currentPage].quantity = num - 1
            // Update label to show current value
            updateQuantityRemainingLabel()
        }
        
        // TODO: call save() here 
        // Alternatively, should save() be called within updateQuantityRemaining() -> this way it will automatically be called in both addSleeve and removePod
    }
    
    // MARK: - ScrollView
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    
//    var imageView: UIImageView!
    var pageImages: [UIImage] = []
    var pageViews: [UIImageView?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect PickerView data
        picker.delegate = self
        picker.dataSource = self
        
        // When app first loads the default category will be "intenso"
        currentPickerCategory = model.intensoArray
        showImagesForCurrentPickerCategory()
    }
    
    func showImagesForCurrentPickerCategory() {
        // Clear array of page images so that new images can be loaded
        resetValuesAndArrays()
        
        // 1 Associate each individual image with a page in the Scroll View
        for value in currentPickerCategory {
            pageImages.append(value.icon)
        }
        
        // The quantityRemaining shown when the view first loads should relate to the current page.
        // MARK: currentPage should stay the same when user closes and re-opens the app.
        quantityRemaining.text = "\(currentPickerCategory[currentPage].quantity)" // TODO: update to work with Core Data - call function updateQuantityRemainingLabel()
        
        let pageCount = pageImages.count
        
        // 2
        pageControl.currentPage = 0
        pageControl.numberOfPages = pageCount
        
        // 3
        for _ in 0..<pageCount {
            pageViews.append(nil)
        }
        
        // 4
        let pagesScrollViewSize = scrollView.frame.size
        scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * CGFloat(pageImages.count), pagesScrollViewSize.height)
        
        // 5
        loadVisiblePages()
    }
    
    func resetValuesAndArrays() {
        pageImages = []
        pageViews = []
        currentPage = 0
        scrollView.bounds.origin.x = 0.0 // This resets both the Scroll View and Page Control back to the first page
    }
    
    func loadPage(page: Int) {
        
        if page < 0 || page >= pageImages.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // 1
        if let _ = pageViews[page] {
            // Do nothing. The view is already loaded.
        } else {
            // 2
            var frame = scrollView.bounds
            frame.origin.x = frame.size.width * CGFloat(page)
            frame.origin.y = 0.0
            
            // 3
            let newPageView = UIImageView(image: pageImages[page])
            newPageView.contentMode = .ScaleAspectFit
            newPageView.frame = frame
            scrollView.addSubview(newPageView)
            
            // 4
            pageViews[page] = newPageView
        }
    }
    
    func purgePage(page: Int) {
        
        if page < 0 || page >= pageImages.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // Remove a page from the scroll view and reset the container array
        if let pageView = pageViews[page] {
            pageView.removeFromSuperview()
            pageViews[page] = nil
        }
    }
    
    func loadVisiblePages() {
        
        // First, determine which page is currently visible
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        
        // Assign current page number to global variable
        currentPage = page
        
        // Update the page control
        pageControl.currentPage = page
        
        // Work out which pages you want to load
        let firstPage = page - 1
        let lastPage = page + 1
        
        // Purge anything before the first page
        for var index = 0; index < firstPage; ++index {
            purgePage(index)
        }
        
        // Load pages in our range
        for var index = firstPage; index <= lastPage; ++index {
            loadPage(index)
        }
        
        // Purge anything after the last page
        for var index = lastPage+1; index < pageImages.count; ++index {
            purgePage(index)
        }
        
        updateQuantityRemainingLabel()
        updateInfoLabels()
    }
    
    // For each coffee type, keep the associated label.text in sync with current number of coffee pods
    func updateQuantityRemainingLabel() { // Use CoreData to retrieve the quantity of the currently selected coffee
        
        // TODO: remove once confirmed Core Data working
//        quantityRemaining.text = "\(currentPickerCategory[currentPage].quantity)"
        
        let coffeeName = currentPickerCategory[currentPage].name
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        // 1 - Fetch individual coffee type from CoreData (use predicates?)
        let request = NSFetchRequest(entityName: "Coffee") // Ask database to perform a request on the "Coffee" table
        request.returnsObjectsAsFaults = false // Prevent CoreData from returning objects as faults
        request.predicate = NSPredicate(format: "name = %@", coffeeName) // Create predicate - only fetch the coffee we wish to update
        
        do { // Execute fetch request in a safe way
            
            let resultArray = try managedContext.executeFetchRequest(request) // resultArray is used because it is safer to accept results into an array (rather than a single AnyObject), just in case more than one result is returned. This may happen in the case where two coffees with the same name have been erroneously saved to CoreData.
            
            if resultArray.count == 1 { // We only expect a single result
                
                let result = resultArray[0] // Assign first (and only) result to constant named result.
                
                if let quantity = result.valueForKey("quantity") as! Int? { // Downcast quantity to type Int
                    quantityRemaining.text = "\(quantity)"
                }
            } else {
                print("Potential Error - \(resultArray.count) results returned.")
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func updateInfoLabels() {
        nameLabel.text = "Name: \(currentPickerCategory[currentPage].name)"
//        intensityLabel.text = "Intensity: \(model.coffeeDetails[currentPage].intensity)"
//        sizeLabel.text = "Size: \(model.coffeeDetails[currentPage].size)"
//        aromaLabel.text = "Aroma: \(model.coffeeDetails[currentPage].aroma)"
//        notesLabel.text = "Notes: \(model.coffeeDetails[currentPage].notes)"
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        loadVisiblePages()
    }

    // MARK: - PickerView
    var pickerData = ["Intenso", "Espresso", "Pure Origin", "Lungo", "Decaffeinato", "Variations"]
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let string = pickerData[row]
        return NSAttributedString(string: string, attributes: [NSForegroundColorAttributeName:UIColor.whiteColor()])
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch row {
        case 0:
            currentPickerCategory = model.intensoArray // 1. Update currentPickerCategory
            showImagesForCurrentPickerCategory() // 2. Load images from intensoArray
        case 1:
            print("Espresso!")
            currentPickerCategory = model.espressoArray
            showImagesForCurrentPickerCategory()
        case 2:
            print("Pure Origin!")
            currentPickerCategory = model.pureOriginArray
            showImagesForCurrentPickerCategory()
        case 3:
            print("Lungo!")
            currentPickerCategory = model.lungoArray
            showImagesForCurrentPickerCategory()
        case 4:
            print("Decaffeinato!")
            currentPickerCategory = model.decaffeinatoArray
            showImagesForCurrentPickerCategory()
        case 5:
            print("Variations!")
            currentPickerCategory = model.variationsArray
            showImagesForCurrentPickerCategory()
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - CoreData
    // TODO: Write function to retrieve (and return) the currently selected coffee? This would avoid repetition in the save() and update() functions, for example.
    
    func saveSelectedCoffee() { // Save to CoreData
        
        // Useful Links:
        // http://www.raywenderlich.com/115695/getting-started-with-core-data-tutorial
        // https://www.youtube.com/watch?v=3IDfgATVqHw
        
        // 1 - Fetch individual coffee type from CoreData (use predicates?)
        // 2 - Update quantity of coffee
        // 3 - Save coffee back to CoreData
        let coffeeName = currentPickerCategory[currentPage].name
        let coffeeQuantity = currentPickerCategory[currentPage].quantity // This value will be used to update Core Data model
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        // 1 - Fetch individual coffee type from CoreData (use predicates?)
        let request = NSFetchRequest(entityName: "Coffee") // Ask database to perform a request on the "Coffee" table
        request.returnsObjectsAsFaults = false // Prevent CoreData from returning objects as faults
        request.predicate = NSPredicate(format: "name = %@", coffeeName) // Create predicate - only fetch the coffee we wish to update
        
        do { // Execute fetch request in a safe way
            
            let resultArray = try managedContext.executeFetchRequest(request) // resultArray is used because it is safer to accept results into an array (rather than a single AnyObject), just in case more than one result is returned. This may happen in the case where two coffees with the same name have been erroneously saved to CoreData.
            
            if resultArray.count == 1 { // We only expect a single result
                
                let result = resultArray[0] // Assign first (and only) result to constant named result.
                
                result.setValue(coffeeQuantity, forKey: "quantity") // Update quantity for selected coffee
                
                // Save quantity of selected coffee only
                do {
                    try managedContext.save()
                    print("Saved successfully! Quantity of \(coffeeName) is now \(coffeeQuantity)")
                } catch let error as NSError  {
                    print("Could not save \(error), \(error.userInfo)")
                }
            } else {
                print("Potential Error - \(resultArray.count) results returned.")
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
//        load()
    }
    
    func loadAllCoffees() { // Load from CoreData
//        let currentCoffee = currentPickerCategory[currentPage]
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let request = NSFetchRequest(entityName: "Coffee") // Ask database to perform a request on the "Coffee" table
        request.returnsObjectsAsFaults = false // Prevent CoreData from returning objects as faults
        
        do { // Execute fetch request in a safe way
            let results: NSArray = try managedContext.executeFetchRequest(request)
            
            if results.count > 0 { // very basic error handling
                for res in results {
                    print(res)
                }
            } else {
                print("Potential Error - \(results.count) results returned")
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    // Re-write load() function using predicates
    // function should be called each time user swipes/changes coffee type
    // this way, the number (coffeeQuantity) shown to the user will always be the most up to date i.e. whatever was last saved to CoreData
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadAllCoffees()
    }
}


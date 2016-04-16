//
//  ViewController.swift
//  Coffee Companion
//
//  Created by Matthew Gaddes on 28/12/2015.
//  Copyright © 2015 Matthew Gaddes. All rights reserved.
//

// Tutorials used in this project:
// UIScrollView - Ray Wenderlich - http://www.raywenderlich.com/76436/use-uiscrollview-scroll-zoom-content-swift
// Core Data - Ray Wenderlich - http://www.raywenderlich.com/115695/getting-started-with-core-data-tutorial
// Core Data - Rm2kdev - https://www.youtube.com/watch?v=3IDfgATVqHw

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
    
    // Create arrays - these will be updated through the function updateArrays()
    var intensoArray = [Coffee]()
    var espressoArray = [Coffee]()
    var pureOriginArray = [Coffee]()
    var lungoArray = [Coffee]()
    var decaffeinatoArray = [Coffee]()
    var variationsArray = [Coffee]()
    
    let model = Model()
    
    // TODO: The below value may have to be changed to ensure currentPage remains the same when user closes and re-opens the app
    var currentPage = 0 // When app is first run, "currentPage" will be 0. This matches the value of "page", as calculated in func loadVisiblePages()
    var currentPickerCategory: [Coffee] = [] // This is given an initial value in func viewDidLoad()
    
    @IBAction func addSleeve(sender: UIButton)
    {
        if let _ = Int(quantityRemaining.text!) { // Check that quantityRemaining (String) can be expressed as type Int
            saveQuantityAndUpdateLabel(incrementOrDecrement: 10) // Save newly-updated value to CoreData (increase by 10) and update label
        } else {
            print("Error - Value of quantityRemaining cannot be expressed as type Int")
        }
    }
    
    @IBAction func removePod(sender: UIButton)
    {
        if let num = Int(quantityRemaining.text!) { // Check that quantityRemaining (String) can be expressed as type Int
            if num > 0 { // This prevents number of pods being a negative number
                saveQuantityAndUpdateLabel(incrementOrDecrement: -1) // Save newly-updated value to CoreData (decrease by 1) and update label
            }
        } else {
            print("Error - Value of quantityRemaining cannot be expressed as type Int")
        }
    }
    
    // MARK: - ScrollView
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    
    var pageImages: [UIImage] = []
    var pageViews: [UIImageView?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect PickerView data
        picker.delegate = self
        picker.dataSource = self
        
        // When app first loads the default category will be "intenso"
//        currentPickerCategory = model.intensoArray
//        showImagesForCurrentPickerCategory()
        
        currentPickerCategory = createArrayFromDictionary(model.intensoDict)
        showImagesForCurrentPickerCategory()
    }
    
    func showImagesForCurrentPickerCategory() {
        
        // Clear array of page images so that new images can be loaded
        resetValuesAndArrays()
        
        // Comments 1-5: Ray Wenderlich - UIScrollView Tutorial - http://goo.gl/FflMhj - Ctrl-F "Next, implement viewDidLoad as follows"
        
        // 1 Associate each individual image with a page in the Scroll View
        for value in currentPickerCategory {
            pageImages.append(value.icon)
        }
        
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
        
        // Comments 1-4: Ray Wenderlich - UIScrollView Tutorial - http://goo.gl/FflMhj - Ctrl-F "Remember each page is a UIImageView stored in an array of optionals"
        
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
        
        loadQuantityFromDataModel()
        updateInfoLabels()
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
            print("Intenso!")
            currentPickerCategory = model.intensoArray // Update currentPickerCategory
            showImagesForCurrentPickerCategory() // Load images from intensoArray
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
    
    // MARK: - Create and Update Arrays
    
    func createArrayFromDictionary(dict: [String : Coffee]) -> [Coffee] { // Used to create an array holding only the coffees for which .isIncluded == true
        
        var outputArray = [Coffee]()
        
        // rearrange items in dict to be in alphabetical order of key
        // if we require the items to be sorted in a particular order, we can sort them using the attribute ".orderingNo" - the value associated with this attribute can be changed in the model to define the order of coffees
        let sortedDict = dict.sort { $0.0 < $1.0 } // see above
        
        for item in sortedDict { // loop through items in newly-sorted array
            if item.1.isIncluded == true { // TODO: confirm coffee is to be included - replace this with result from core data!
                outputArray.append(item.1)
            }
        }
        
        return outputArray
    }
    
    // TODO: call this function when app loads (populate arrays!)
    func updateArrays() { // Update all arrays at once (arrays created from dictionaries)
        intensoArray = createArrayFromDictionary(model.intensoDict)
        espressoArray = createArrayFromDictionary(model.espressoDict)
        pureOriginArray = createArrayFromDictionary(model.pureOriginDict)
        lungoArray = createArrayFromDictionary(model.lungoDict)
        decaffeinatoArray = createArrayFromDictionary(model.decaffeinatoDict)
        variationsArray = createArrayFromDictionary(model.variationsDict)
    }
    
    // MARK: - CoreData
    func saveQuantityAndUpdateLabel(incrementOrDecrement incrementOrDecrement: Int) { // Save to CoreData
        
        let coffeeName = currentPickerCategory[currentPage].name
        print("SAVE - current coffee name = \(coffeeName)")
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        // Fetch individual coffee type from CoreData using predicates
        let request = NSFetchRequest(entityName: "Coffee") // Ask database to perform a request on the "Coffee" table
        request.returnsObjectsAsFaults = false // Prevent CoreData from returning objects as faults
        request.predicate = NSPredicate(format: "name = %@", coffeeName) // Create predicate - only fetch the coffee we wish to update
        
        do { // Execute fetch request in a safe way
            
            let resultArray = try managedContext.executeFetchRequest(request) // resultArray is used because it is safer to accept results into an array (rather than a single AnyObject), just in case more than one result is returned. This may happen in the case where two coffees with the same name have been erroneously saved to CoreData.
            
            if resultArray.count == 1 { // We only expect a single result
                
                let result = resultArray[0] // Assign first (and only) result to constant named result.
                
                // Update quantity and save to Core Data, all in one step
                if let currentQuantity = result.valueForKey("quantity") as! Int? { // Downcast quantity to type Int
                    let updatedQuantity = currentQuantity + incrementOrDecrement // Calculate updated quantity by adding or subtracting (as appropriate)
                    result.setValue(updatedQuantity, forKey: "quantity") // Assign updated quantity to selected coffee in Core Data
                    quantityRemaining.text = "\(updatedQuantity)" // Update label
                } else {
                    print("Error - 'quantity' is not an Int")
                }
                
                // Save quantity of selected coffee only
                do {
                    try managedContext.save()
                    print("Saved successfully!")
                } catch let error as NSError  {
                    print("Error - Could not save \(error), \(error.userInfo)")
                }
            } else {
                print("Potential Error - \(resultArray.count) results returned.")
            }
        } catch let error as NSError {
            print("Error - Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func loadQuantityFromDataModel() {
        
        // For the currently-selected coffee type, this function loads the value of "quantity" from Core Data and uses it to update the label on screen (quantityRemaining)
        
        let coffeeName = currentPickerCategory[currentPage].name
        print("LOAD - current coffee name = \(coffeeName)")
        
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
    
    // MARK: - Unwind Segues for MenuTableViewController
    @IBAction func saveAndReturn(segue:UIStoryboardSegue) {
        
        // https://www.youtube.com/watch?v=guSYMPaXLaw
//        var destination = segue.destinationViewController as! MenuTableViewController
        
        // MARK: CONTINUE from here!!x
    }
    
    // TODO: Determine which coffees should be presented to the user (they may have switched one or more off in the menu)
    func determine() {
    }
    
    // MARK: - Default Overrides
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


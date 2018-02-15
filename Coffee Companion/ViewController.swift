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
    
    // Button outlets
    @IBOutlet weak var addSleeve_OUTLET: UIButton!
    @IBOutlet weak var removePod_OUTLET: UIButton!
    
    // Define default colours (used to reset background colour for each button)
    let addSleeveDefaultColour = UIColor(red: 0.4, green: 1, blue: 0.4, alpha: 0.852275)
    let removePodDefaultColour = UIColor(red: 1, green: 0.4, blue: 0.4, alpha: 1)
    
    // Create arrays - these will be updated through the function updateArrays()
    var intensoArray = [Coffee]()
    var espressoArray = [Coffee]()
    var pureOriginArray = [Coffee]()
    var lungoArray = [Coffee]()
    var decaffeinatoArray = [Coffee]()
    var variationsArray = [Coffee]()
    let emptyArray = [Coffee(name: "", intensity: 0, size: "", aroma: "", notes: "", icon: UIImage(named: "Empty.png")!, isIncludedSwitchName: "", isIncluded: true, orderingNo: 0)] // "Empty" array used to check whether or not a particular category is empty
    
    let model = Model()
    
    // TODO: The below value may have to be changed to ensure currentPage remains the same when user closes and re-opens the app
    var currentPage = 0 // When app is first run, "currentPage" will be 0. This matches the value of "page", as calculated in func loadVisiblePages()
    var currentPickerCategory = [Coffee]() // This is given an initial value in func viewDidLoad()
    var currentPickerCategoryName = "" // This is used during unwind segue to determine the currentPickerCategory (and then reload the appropriate coffees)
    
    @IBAction func addSleeve(_ sender: UIButton)
    {
        if let _ = Int(quantityRemaining.text!) { // Check that quantityRemaining (String) can be expressed as type Int
            saveQuantityAndUpdateLabel(incrementOrDecrement: 10) // Save newly-updated value to CoreData (increase by 10) and update label
        } else {
            print("Error - Value of quantityRemaining cannot be expressed as type Int")
        }
    }
    
    @IBAction func removePod(_ sender: UIButton)
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
        
        updateArrays() // Populate arrays when app first loads
        
        // TODO: delete this line? It may be required in the case where the category is NO LONGER EMPTY?
        enableButtonsAndResetColour() // Ensure buttons are enabled when app first loads
        
        // Connect PickerView data
        picker.delegate = self
        picker.dataSource = self
        
        currentPickerCategory = intensoArray // When app first loads the default category will be "intenso"
        currentPickerCategoryName = "Intenso"
        
        showImagesForCurrentPickerCategory()
        
        checkIfArrayIsEmpty(currentPickerCategory) // Check if current category is empty and update buttons and text accordingly
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
        scrollView.contentSize = CGSize(width: pagesScrollViewSize.width * CGFloat(pageImages.count), height: pagesScrollViewSize.height)
        
        // 5
        loadVisiblePages()
    }
    
    func resetValuesAndArrays() {
        pageImages = []
        pageViews = []
        currentPage = 0
        scrollView.bounds.origin.x = 0.0 // This resets both the Scroll View and Page Control back to the first page
    }
    
    func loadPage(_ page: Int) {
        
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
            newPageView.contentMode = .scaleAspectFit
            newPageView.frame = frame
            scrollView.addSubview(newPageView)
            
            // 4
            pageViews[page] = newPageView
        }
    }
    
    func purgePage(_ page: Int) {
        
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
        
        // Purge anything before the first page - CHANGED '+= 1' to '+ 1' 15/02/18 https://stackoverflow.com/questions/40388873/mutating-operator-error-after-changing-to-swift-3-issue-researched-but-cant-s
        for index in 0 ..< firstPage + 1 {
            purgePage(index)
        }
        
        // Load pages in our range - DEPRECATED 15/02/18
//        for var index = firstPage; index <= lastPage; index += 1 {
//            loadPage(index)
//        }
        
        // Load pages in our range
        for var index in firstPage..<lastPage {
            loadPage(index)
            index += 1
        }
        
        // Purge anything after the last page - CHANGED '+= 1' to '+ 1' 15/02/18 https://stackoverflow.com/questions/40388873/mutating-operator-error-after-changing-to-swift-3-issue-researched-but-cant-s
        for index in lastPage+1 ..< pageImages.count + 1 {
            purgePage(index)
        }
        
        if currentPickerCategory.isEmpty {
            // Do NOT call the following two functions - the category contains no coffees and so, because these functions require access to the array's contents (which do not exist), the app will crash
        } else {
            loadQuantityFromDataModel()
            updateInfoLabels()
        }
    }
    
    func updateInfoLabels() {
        nameLabel.text = "Name: \(currentPickerCategory[currentPage].name)"
//        intensityLabel.text = "Intensity: \(model.coffeeDetails[currentPage].intensity)"
//        sizeLabel.text = "Size: \(model.coffeeDetails[currentPage].size)"
//        aromaLabel.text = "Aroma: \(model.coffeeDetails[currentPage].aroma)"
//        notesLabel.text = "Notes: \(model.coffeeDetails[currentPage].notes)"
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        loadVisiblePages()
    }
    
    // MARK: - PickerView
    var pickerData = ["Intenso", "Espresso", "Pure Origin", "Lungo", "Decaffeinato", "Variations"]
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let string = pickerData[row]
        return NSAttributedString(string: string, attributes: [NSAttributedStringKey.foregroundColor:UIColor.white])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch row {
        case 0:
            print("Intenso!")
            enableButtonsAndResetColour()
            currentPickerCategory = intensoArray // Update currentPickerCategory
            currentPickerCategoryName = "Intenso" // Update currentPickerCategoryName
            showImagesForCurrentPickerCategory() // Load images from intensoArray
            print(intensoArray)
            checkIfArrayIsEmpty(intensoArray) // Check if array is empty
        case 1:
            print("Espresso!")
            enableButtonsAndResetColour()
            currentPickerCategory = espressoArray
            currentPickerCategoryName = "Espresso"
            showImagesForCurrentPickerCategory()
            checkIfArrayIsEmpty(espressoArray)
        case 2:
            print("Pure Origin!")
            enableButtonsAndResetColour()
            currentPickerCategory = pureOriginArray
            currentPickerCategoryName = "Pure Origin"
            showImagesForCurrentPickerCategory()
            checkIfArrayIsEmpty(pureOriginArray)
        case 3:
            print("Lungo!")
            enableButtonsAndResetColour()
            currentPickerCategory = lungoArray
            currentPickerCategoryName = "Lungo"
            showImagesForCurrentPickerCategory()
            checkIfArrayIsEmpty(lungoArray)
        case 4:
            print("Decaffeinato!")
            enableButtonsAndResetColour()
            currentPickerCategory = decaffeinatoArray
            currentPickerCategoryName = "Decaffeinato"
            showImagesForCurrentPickerCategory()
            checkIfArrayIsEmpty(decaffeinatoArray)
        case 5:
            print("Variations!")
            enableButtonsAndResetColour()
            currentPickerCategory = variationsArray
            currentPickerCategoryName = "Variations"
            showImagesForCurrentPickerCategory()
            checkIfArrayIsEmpty(variationsArray)
        default:
            break
        }
    }
    
    // MARK: - Create and Update Arrays
    
    func createArrayFromDictionary(_ dict: [String : Coffee]) -> [Coffee] { // Used to create an array holding only the coffees for which .isIncluded == true
        
        var outputArray = [Coffee]()
        
        // rearrange items in dict to be in alphabetical order of key
        // if we require the items to be sorted in a particular order, we can sort them using the attribute ".orderingNo" - the value associated with this attribute can be changed in the model to define the order of coffees
        let sortedDict = dict.sorted { $0.0 < $1.0 } // see above
        
        for item in sortedDict { // loop through items in newly-sorted array
            
            // MARK: optimise core data?
            // Can we fetch an array of items from core data, rather than having to fetch each coffee individually (and create a new managedContext etc.) each time?
            
            let coffeeName = item.1.name // MARK: This must exactly match the coffee name within core data
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            
            // Fetch individual coffee type from CoreData using predicates
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Coffee") // Ask database to perform a request on the "Coffee" table
            request.returnsObjectsAsFaults = false // Prevent CoreData from returning objects as faults
            request.predicate = NSPredicate(format: "name = %@", coffeeName) // Create predicate - only fetch the coffee we wish to update
            
            do { // Execute fetch request in a safe way
                
                let resultArray = try managedContext.fetch(request) // resultArray is used because it is safer to accept results into an array (rather than a single AnyObject), just in case more than one result is returned. This may happen in the case where two coffees with the same name have been erroneously saved to CoreData.
                
                if resultArray.count == 1 { // We only expect a single result
                    
                    let result = resultArray[0] // Assign first (and only) result to constant named result.
                    
                    // Check whether isIncluded == true or false
                    if let trueOrFalse = (result as AnyObject).value(forKey: "isIncluded") as! Bool? { // Downcast isIncluded to type Bool
                        // Mark: downcast - type safety
                        // See above, is there a way to avoid forced downcast? Currently it is necessary because result.valueForKey is returned as type AnyObject
                        if trueOrFalse == true {
                            outputArray.append(item.1)
                        }
                    } else {
                        print("Error - 'isIncluded' is not a Bool")
                    }
                } else {
                    print("Potential Error - \(resultArray.count) results returned.")
                }
            } catch let error as NSError {
                print("Error - Could not fetch \(error), \(error.userInfo)")
            }
        }
        
        // Prevent app crash when number of coffees in category = 0
        return checkIfArrayIsEmptyAndReturn(outputArray)
    }
    
    func checkIfArrayIsEmptyAndReturn(_ inputArray: [Coffee]) -> [Coffee] { // Return coffee type
        
        // N.B. If inputArray is NOT empty, the function simply returns this same, unmodified array
        
        if inputArray.isEmpty {
            
            // Remove labels
            nameLabel.text = "Name: N/A"
            quantityRemaining.text = ""
            
            // TODO: delete the following comment
            // N.B. The quantityRemaining label is updated through the function loadQuantityFromDataModel() and so we do not need to remove the label here
            
            // Disable buttons & change background colour
            addSleeve_OUTLET.isEnabled = false
            removePod_OUTLET.isEnabled = false
            
            addSleeve_OUTLET.backgroundColor = UIColor.gray
            removePod_OUTLET.backgroundColor = UIColor.gray
            
            let outputArray = emptyArray
            
            return outputArray
            
        } else {
            return inputArray
        }
    }
    
    func checkIfArrayIsEmpty(_ inputArray: [Coffee]) { // Same as above, except do not return anything, simply alter the labels and buttons
        
        // N.B. If inputArray is NOT empty, the function does not change anything
        
        if inputArray[0].icon == emptyArray[0].icon { // TODO: rewrite this boolean check - it is not elegant (or safe)
            
            // Remove labels
            nameLabel.text = "Name: N/A"
            quantityRemaining.text = ""
            
            // TODO: delete the following comment
            // N.B. The quantityRemaining label is updated through the function loadQuantityFromDataModel() and so we do not need to remove the label here
            
            // Disable buttons & change background colour
            addSleeve_OUTLET.isEnabled = false
            removePod_OUTLET.isEnabled = false
            
            addSleeve_OUTLET.backgroundColor = UIColor.gray
            removePod_OUTLET.backgroundColor = UIColor.gray
        }
        
        // TODO: write an "else" block to revert the button colours (is this necessary?)
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
    
    func enableButtonsAndResetColour() {
        // Enable buttons & reset background colour
        addSleeve_OUTLET.isEnabled = true
        removePod_OUTLET.isEnabled = true
        
        addSleeve_OUTLET.backgroundColor = addSleeveDefaultColour
        removePod_OUTLET.backgroundColor = removePodDefaultColour
    }
    
    // MARK: - CoreData
    func saveQuantityAndUpdateLabel(incrementOrDecrement: Int) { // Save to CoreData
        
        let coffeeName = currentPickerCategory[currentPage].name
        print("SAVE - current coffee name = \(coffeeName)")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        // Fetch individual coffee type from CoreData using predicates
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Coffee") // Ask database to perform a request on the "Coffee" table
        request.returnsObjectsAsFaults = false // Prevent CoreData from returning objects as faults
        request.predicate = NSPredicate(format: "name = %@", coffeeName) // Create predicate - only fetch the coffee we wish to update
        
        do { // Execute fetch request in a safe way
            
            let resultArray = try managedContext.fetch(request) // resultArray is used because it is safer to accept results into an array (rather than a single AnyObject), just in case more than one result is returned. This may happen in the case where two coffees with the same name have been erroneously saved to CoreData.
            
            if resultArray.count == 1 { // We only expect a single result
                
                let result = resultArray[0] // Assign first (and only) result to constant named result.
                
                // Update quantity and save to Core Data, all in one step
                if let currentQuantity = (result as AnyObject).value(forKey: "quantity") as! Int? { // Downcast quantity to type Int
                    let updatedQuantity = currentQuantity + incrementOrDecrement // Calculate updated quantity by adding or subtracting (as appropriate)
                    (result as AnyObject).setValue(updatedQuantity, forKey: "quantity") // Assign updated quantity to selected coffee in Core Data
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
        
        let coffeeName = currentPickerCategory[currentPage].name // If coffeeName exists (i.e. check the category is not empty)
        print("LOAD - current coffee name = \(coffeeName)")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        // 1 - Fetch individual coffee type from CoreData (use predicates?)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Coffee") // Ask database to perform a request on the "Coffee" table
        request.returnsObjectsAsFaults = false // Prevent CoreData from returning objects as faults
        request.predicate = NSPredicate(format: "name = %@", coffeeName) // Create predicate - only fetch the coffee we wish to update
        
        do { // Execute fetch request in a safe way
            
            let resultArray = try managedContext.fetch(request) // resultArray is used because it is safer to accept results into an array (rather than a single AnyObject), just in case more than one result is returned. This may happen in the case where two coffees with the same name have been erroneously saved to CoreData.
            
            if resultArray.count == 1 { // We only expect a single result
                
                let result = resultArray[0] // Assign first (and only) result to constant named result.
                
                if let quantity = (result as AnyObject).value(forKey: "quantity") as! Int? { // Downcast quantity to type Int
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
    @IBAction func unwindFromMenu(_ unwindSegue: UIStoryboardSegue) {
        
        // Reload/refresh currentPickerCategory. This is achieved by using a switch statement to determine the name of the currentPickerCategory, then using this knowledge to assign the appropriate array back to currentPickerCategory. This assignment replaces the old array with the updated array of the same name (effectively reloading/refreshing the coffees). This is necessary because, after the user returns (unwinds) from the menu, it is likely that individual coffees will have been added or removed.
        
        updateArrays() // Update all arrays (only include coffees for which isIncluded == true)
        
        switch currentPickerCategoryName { // Update currentPickerCategory
        case "Intenso":
            currentPickerCategory = intensoArray
        case "Espresso":
            currentPickerCategory = espressoArray
        case "Pure Origin":
            currentPickerCategory = pureOriginArray
        case "Lungo":
            currentPickerCategory = lungoArray
        case "Decaffeinato":
            currentPickerCategory = decaffeinatoArray
        case "Variations":
            currentPickerCategory = variationsArray
        default:
            break
        }
        
        showImagesForCurrentPickerCategory() // Load images/icons based on updated array
        
        // MARK: CONTINUE from here!!
    }
    
    // MARK: - Default Overrides
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


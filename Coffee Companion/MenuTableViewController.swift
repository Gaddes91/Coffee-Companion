//
//  MenuTableViewController.swift
//  Coffee Companion
//
//  Created by Matthew Gaddes on 27/03/2016.
//  Copyright © 2016 Matthew Gaddes. All rights reserved.
//

import UIKit
import CoreData

class MenuTableViewController: UITableViewController {
    
    // MARK: - isIncluded menu switches OUTLETS
    @IBOutlet weak var isIncludedArpeggio_OUTLET: UISwitch!
    @IBOutlet weak var isIncludedDharkan_OUTLET: UISwitch!
    @IBOutlet weak var isIncludedKazaar_OUTLET: UISwitch!
    @IBOutlet weak var isIncludedRistretto_OUTLET: UISwitch!
    @IBOutlet weak var isIncludedRoma_OUTLET: UISwitch!
    
    // MARK: - isIncluded menu switches ACTIONS
    @IBAction func isIncludedArpeggio_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedArpeggio_OUTLET)
        printIsIncludedSwitchStatus()
    }
    @IBAction func isIncludedDharkan_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedDharkan_OUTLET)
        printIsIncludedSwitchStatus()
    }
    @IBAction func isIncludedKazaar_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedKazaar_OUTLET)
        printIsIncludedSwitchStatus()
    }
    @IBAction func isIncludedRistretto_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedRistretto_OUTLET)
        printIsIncludedSwitchStatus()
    }
    @IBAction func isIncludedRoma_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedRoma_OUTLET)
        printIsIncludedSwitchStatus()
    }
    // MARK: -
    
    // TODO: Test whether boolean values are really changing within core data
    // TODO: Load boolean values for every coffee type when main view appears - this will allow us to prevent showing coffees when they are not required.
    
    
    
    func checkStatusOfSwitches() {
        print("\(isIncludedArpeggio_OUTLET.enabled)")
    }
    
    func updateIsIncludedStatus() {
        if isIncludedArpeggio_OUTLET.enabled == true {
            // TODO: set isIncluded parameter in Core Data = TRUE
        } else {
            // TODO: set isIncluded = FALSE
        }
    }
    
    func updateIsIncludedStatusWithinCoreData(switchOutlet switchOutlet: UISwitch) { // TODO: pass in switchOutlet when switch changes...
        
        var coffeeName = ""
        var newSwitchStatus = true // Initialiser defaults to true
        
        // Call switch method to determine which of the UISwitches was activated
        switch switchOutlet {
        case isIncludedArpeggio_OUTLET:
            // This name must exactly match the name assigned in the model (i.e. when calling Coffee.name). This, in turn, exactly matches the name within the data model (assigned within AppDelegate.swift)
            coffeeName = "Arpeggio"
        case isIncludedDharkan_OUTLET:
            coffeeName = "Dharkan"
        case isIncludedKazaar_OUTLET:
            coffeeName = "Kazaar"
        case isIncludedRistretto_OUTLET:
            coffeeName = "Ristretto"
        case isIncludedRoma_OUTLET:
            coffeeName = "Roma"
        default:
            break
            // TODO: We should either:
            //     1. Break out of the whole function here, to avoid erroneously altering any core data values
            //     2. Say coffeeName = "" and then handle the error a few lines down... what happens if NSPredicate cannot find a value (i.e. a coffee whose name = "")?
        }
        
        // Assign true/false depending on whether switch is on/off. This will be used to update core data.
        if switchOutlet.on == true { // If switch is ON
            newSwitchStatus = true
        } else { // If switch is OFF
            newSwitchStatus = false
        }
        
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
                
                // Update switch status and save to Core Data, all in one step
                if let _ = result.valueForKey("isIncluded") as! Bool? { // Downcast switch status to type Bool
                
                    result.setValue(newSwitchStatus, forKey: "isIncluded") // Assign updated switch status to selected coffee in Core Data
                } else {
                    print("Error - 'isIncluded' is not a Bool")
                }
                
                // Save switch status of selected coffee only
                do {
                    try managedContext.save()
                    if newSwitchStatus == true {
                        print("Saved successfully - \(coffeeName) WILL be included")
                    } else {
                        print("Saved successfully - \(coffeeName) WON'T be included")
                    }
                    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func editItemsInMenu(sender: UIBarButtonItem) {
        
    }
    
    // MARK: - Functions for testing/debugging
    func printIsIncludedSwitchStatus() {
        print("Arpeggio switch ON = \(isIncludedArpeggio_OUTLET.on)")
        print("Dharkan switch ON = \(isIncludedDharkan_OUTLET.on)")
        print("Kazaar switch ON = \(isIncludedKazaar_OUTLET.on)")
        print("Ristretto switch ON = \(isIncludedRistretto_OUTLET.on)")
        print("Roma switch ON = \(isIncludedRoma_OUTLET.on)")
    }
    
    
    // MARK: - Table view data source
    // MARK: Can this all be deleted?
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

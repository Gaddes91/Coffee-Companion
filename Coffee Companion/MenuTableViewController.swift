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
    
    @IBOutlet weak var isIncludedCapriccio_OUTLET: UISwitch!
    @IBOutlet weak var isIncludedCosi_OUTLET: UISwitch!
    @IBOutlet weak var isIncludedLivanto_OUTLET: UISwitch!
    @IBOutlet weak var isIncludedVolluto_OUTLET: UISwitch!
    
    @IBOutlet weak var isIncludedBukeela_OUTLET: UISwitch!
    @IBOutlet weak var isIncludedDulsao_OUTLET: UISwitch!
    @IBOutlet weak var isIncludedIndriya_OUTLET: UISwitch!
    @IBOutlet weak var isIncludedRosabaya_OUTLET: UISwitch!

    @IBOutlet weak var isIncludedFortissio_OUTLET: UISwitch!
    @IBOutlet weak var isIncludedLinizio_OUTLET: UISwitch!
    @IBOutlet weak var isIncludedVivalto_OUTLET: UISwitch!
    
    @IBOutlet weak var isIncludedDecafArpeggio_OUTLET: UISwitch!
    @IBOutlet weak var isIncludedDecafIntenso_OUTLET: UISwitch!
    @IBOutlet weak var isIncludedDecafVivalto_OUTLET: UISwitch!
    @IBOutlet weak var isIncludedDecafVolluto_OUTLET: UISwitch!
    
    @IBOutlet weak var isIncludedCaramelito_OUTLET: UISwitch!
    @IBOutlet weak var isIncludedCiocattino_OUTLET: UISwitch!
    @IBOutlet weak var isIncludedVanilio_OUTLET: UISwitch!
    
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
    
    @IBAction func isIncludedCapriccio_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedCapriccio_OUTLET)
        printIsIncludedSwitchStatus()
    }
    @IBAction func isIncludedCosi_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedCosi_OUTLET)
        printIsIncludedSwitchStatus()
    }
    @IBAction func isIncludedLivanto_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedLivanto_OUTLET)
        printIsIncludedSwitchStatus()
    }
    @IBAction func isIncludedVolluto_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedVolluto_OUTLET)
        printIsIncludedSwitchStatus()
    }
    
    @IBAction func isIncludedBukeela_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedBukeela_OUTLET)
        printIsIncludedSwitchStatus()
    }
    @IBAction func isIncludedDulsao_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedDulsao_OUTLET)
        printIsIncludedSwitchStatus()
    }
    @IBAction func isIncludedIndriya_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedIndriya_OUTLET)
        printIsIncludedSwitchStatus()
    }
    @IBAction func isIncludedRosabaya_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedRosabaya_OUTLET)
        printIsIncludedSwitchStatus()
    }
    
    @IBAction func isIncludedFortissio_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedFortissio_OUTLET)
        printIsIncludedSwitchStatus()
    }
    @IBAction func isIncludedLinizio_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedLinizio_OUTLET)
        printIsIncludedSwitchStatus()
    }
    @IBAction func isIncludedVivalto_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedVivalto_OUTLET)
        printIsIncludedSwitchStatus()
    }
    
    @IBAction func isIncludedDecafArpeggio_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedDecafArpeggio_OUTLET)
        printIsIncludedSwitchStatus()
    }
    @IBAction func isIncludedDecafIntenso_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedDecafIntenso_OUTLET)
        printIsIncludedSwitchStatus()
    }
    @IBAction func isIncludedDecafVivalto_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedDecafVivalto_OUTLET)
        printIsIncludedSwitchStatus()
    }
    @IBAction func isIncludedDecafVolluto_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedDecafVolluto_OUTLET)
        printIsIncludedSwitchStatus()
    }
    
    @IBAction func isIncludedCaramelito_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedCaramelito_OUTLET)
        printIsIncludedSwitchStatus()
    }
    @IBAction func isIncludedCiocattino_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedCiocattino_OUTLET)
        printIsIncludedSwitchStatus()
    }
    @IBAction func isIncludedVanilio_ACTION(sender: UISwitch) {
        updateIsIncludedStatusWithinCoreData(switchOutlet: isIncludedVanilio_OUTLET)
        printIsIncludedSwitchStatus()
    }
    
    // MARK: -
    
    // This func to be used in combination with updateStatusOfAllSwitches()
    func updateIndividualSwitchStatus(switchOutlet switchOutlet: UISwitch) {
        
        var coffeeName = ""
        
        // The following switch statement has been copied directly from func updateIsIncludedStatusWithinCoreData() -> see this method for comments
        switch switchOutlet {
        case isIncludedArpeggio_OUTLET:
            coffeeName = "Arpeggio"
        case isIncludedDharkan_OUTLET:
            coffeeName = "Dharkan"
        case isIncludedKazaar_OUTLET:
            coffeeName = "Kazaar"
        case isIncludedRistretto_OUTLET:
            coffeeName = "Ristretto"
        case isIncludedRoma_OUTLET:
            coffeeName = "Roma"
            
        case isIncludedCapriccio_OUTLET:
            coffeeName = "Capriccio"
        case isIncludedCosi_OUTLET:
            coffeeName = "Cosi"
        case isIncludedLivanto_OUTLET:
            coffeeName = "Livanto"
        case isIncludedVolluto_OUTLET:
            coffeeName = "Volluto"
            
        case isIncludedBukeela_OUTLET:
            coffeeName = "Bukeela ka Ethiopia"
        case isIncludedDulsao_OUTLET:
            coffeeName = "Dulsao do Brasil"
        case isIncludedIndriya_OUTLET:
            coffeeName = "Indriya from India"
        case isIncludedRosabaya_OUTLET:
            coffeeName = "Rosabaya de Colombia"
            
        case isIncludedFortissio_OUTLET:
            coffeeName = "Fortissio Lungo"
        case isIncludedLinizio_OUTLET:
            coffeeName = "Linizio Lungo"
        case isIncludedVivalto_OUTLET:
            coffeeName = "Vivalto Lungo"
            
        case isIncludedDecafArpeggio_OUTLET:
            coffeeName = "Decaffeinato Arpeggio"
        case isIncludedDecafIntenso_OUTLET:
            coffeeName = "Decaffeinato Intenso"
        case isIncludedDecafVivalto_OUTLET:
            coffeeName = "Decaffeinato Vivalto Lungo"
        case isIncludedDecafVolluto_OUTLET:
            coffeeName = "Decaffeinato Volluto"
            
        case isIncludedCaramelito_OUTLET:
            coffeeName = "Caramelito"
        case isIncludedCiocattino_OUTLET:
            coffeeName = "Ciocattino"
        case isIncludedVanilio_OUTLET:
            coffeeName = "Vanilio"
            
        default:
            break
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
                
                // Check the current status of isIncluded in core data
                if let isIncluded = result.valueForKey("isIncluded") as! Bool? { // Downcast switch status to type Bool
                    
                    // TODO: CHECK THIS!
                    // Does the following code change the actual switch itself? Or does it simply change the variable...
                    
                    if isIncluded == true {
//                        switchOutlet.on = true
                        switchOutlet.setOn(true, animated: false) // If the coffee is to be included, the switch should be ON
                    } else {
//                        switchOutlet.on = false
                        switchOutlet.setOn(false, animated: false) // If not, the switch should be OFF
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
    
    func updateStatusOfAllSwitches() {
        
        // 1. link each individual switch to its respective coffee
        // 2. cycle through every coffee, checking within core data whether isIncluded == true
        // 3a. if isIncluded == true -> switch.on = true
        // 3b. else (== false) -> switch.on = false
        
        updateIndividualSwitchStatus(switchOutlet: isIncludedArpeggio_OUTLET)
        updateIndividualSwitchStatus(switchOutlet: isIncludedDharkan_OUTLET)
        updateIndividualSwitchStatus(switchOutlet: isIncludedKazaar_OUTLET)
        updateIndividualSwitchStatus(switchOutlet: isIncludedRistretto_OUTLET)
        updateIndividualSwitchStatus(switchOutlet: isIncludedRoma_OUTLET)
        
        updateIndividualSwitchStatus(switchOutlet: isIncludedCapriccio_OUTLET)
        updateIndividualSwitchStatus(switchOutlet: isIncludedCosi_OUTLET)
        updateIndividualSwitchStatus(switchOutlet: isIncludedLivanto_OUTLET)
        updateIndividualSwitchStatus(switchOutlet: isIncludedVolluto_OUTLET)
        
        updateIndividualSwitchStatus(switchOutlet: isIncludedBukeela_OUTLET)
        updateIndividualSwitchStatus(switchOutlet: isIncludedDulsao_OUTLET)
        updateIndividualSwitchStatus(switchOutlet: isIncludedIndriya_OUTLET)
        updateIndividualSwitchStatus(switchOutlet: isIncludedRosabaya_OUTLET)
        
        updateIndividualSwitchStatus(switchOutlet: isIncludedFortissio_OUTLET)
        updateIndividualSwitchStatus(switchOutlet: isIncludedLinizio_OUTLET)
        updateIndividualSwitchStatus(switchOutlet: isIncludedVivalto_OUTLET)
        
        updateIndividualSwitchStatus(switchOutlet: isIncludedDecafArpeggio_OUTLET)
        updateIndividualSwitchStatus(switchOutlet: isIncludedDecafIntenso_OUTLET)
        updateIndividualSwitchStatus(switchOutlet: isIncludedDecafVivalto_OUTLET)
        updateIndividualSwitchStatus(switchOutlet: isIncludedDecafVolluto_OUTLET)
        
        updateIndividualSwitchStatus(switchOutlet: isIncludedCaramelito_OUTLET)
        updateIndividualSwitchStatus(switchOutlet: isIncludedCiocattino_OUTLET)
        updateIndividualSwitchStatus(switchOutlet: isIncludedVanilio_OUTLET)
    }
    
    func updateIsIncludedStatusWithinCoreData(switchOutlet switchOutlet: UISwitch) { // Pass in switchOutlet when switch changes
        
        var coffeeName = ""
        var newSwitchStatus = true // Initialiser defaults to true
        
        // Call switch method to determine which of the UISwitches was activated
        switch switchOutlet {
        case isIncludedArpeggio_OUTLET:
            // This name must exactly match the name assigned in the model (i.e. when calling Coffee.name). This, in turn, exactly matches the name within the data model (assigned within AppDelegate.swift)
            // Rather than simply typing the name of each coffee below, we could retrieve each one from the model itself. This would be safer, however it would also be (slightly) more taxing on the CPU, and so it has been left as-is
            coffeeName = "Arpeggio"
        case isIncludedDharkan_OUTLET:
            coffeeName = "Dharkan"
        case isIncludedKazaar_OUTLET:
            coffeeName = "Kazaar"
        case isIncludedRistretto_OUTLET:
            coffeeName = "Ristretto"
        case isIncludedRoma_OUTLET:
            coffeeName = "Roma"
        
        case isIncludedCapriccio_OUTLET:
            coffeeName = "Capriccio"
        case isIncludedCosi_OUTLET:
            coffeeName = "Cosi"
        case isIncludedLivanto_OUTLET:
            coffeeName = "Livanto"
        case isIncludedVolluto_OUTLET:
            coffeeName = "Volluto"
        
        case isIncludedBukeela_OUTLET:
            coffeeName = "Bukeela ka Ethiopia"
        case isIncludedDulsao_OUTLET:
            coffeeName = "Dulsao do Brasil"
        case isIncludedIndriya_OUTLET:
            coffeeName = "Indriya from India"
        case isIncludedRosabaya_OUTLET:
            coffeeName = "Rosabaya de Colombia"
            
        case isIncludedFortissio_OUTLET:
            coffeeName = "Fortissio Lungo"
        case isIncludedLinizio_OUTLET:
            coffeeName = "Linizio Lungo"
        case isIncludedVivalto_OUTLET:
            coffeeName = "Vivalto Lungo"
            
        case isIncludedDecafArpeggio_OUTLET:
            coffeeName = "Decaffeinato Arpeggio"
        case isIncludedDecafIntenso_OUTLET:
            coffeeName = "Decaffeinato Intenso"
        case isIncludedDecafVivalto_OUTLET:
            coffeeName = "Decaffeinato Vivalto Lungo"
        case isIncludedDecafVolluto_OUTLET:
            coffeeName = "Decaffeinato Volluto"
            
        case isIncludedCaramelito_OUTLET:
            coffeeName = "Caramelito"
        case isIncludedCiocattino_OUTLET:
            coffeeName = "Ciocattino"
        case isIncludedVanilio_OUTLET:
            coffeeName = "Vanilio"
            
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

        updateStatusOfAllSwitches()
        
        // Uncomment the following line to preserve selection between presentations
//         self.clearsSelectionOnViewWillAppear = false

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
        
        print("Capriccio switch ON = \(isIncludedCapriccio_OUTLET.on)")
        print("Cosi switch ON = \(isIncludedCosi_OUTLET.on)")
        print("Livanto switch ON = \(isIncludedLivanto_OUTLET.on)")
        print("Volluto switch ON = \(isIncludedVolluto_OUTLET.on)")
        
        print("Bukeela ka Ethiopia switch ON = \(isIncludedBukeela_OUTLET.on)")
        print("Dulsao do Brasil switch ON = \(isIncludedDulsao_OUTLET.on)")
        print("Indriya from India switch ON = \(isIncludedIndriya_OUTLET.on)")
        print("Rosabaya de Colombia switch ON = \(isIncludedRosabaya_OUTLET.on)")
        
        print("Fortissio Lungo switch ON = \(isIncludedFortissio_OUTLET.on)")
        print("Linizio Lungo switch ON = \(isIncludedLinizio_OUTLET.on)")
        print("Vivalto Lungo switch ON = \(isIncludedVivalto_OUTLET.on)")
        
        print("Decaffeinato Arpeggio switch ON = \(isIncludedDecafArpeggio_OUTLET.on)")
        print("Decaffeinato Intenso switch ON = \(isIncludedDecafIntenso_OUTLET.on)")
        print("Decaffeinato Vivalto Lungo switch ON = \(isIncludedDecafVivalto_OUTLET.on)")
        print("Decaffeinato Volluto switch ON = \(isIncludedDecafVolluto_OUTLET.on)")
        
        print("Caramelito switch ON = \(isIncludedCaramelito_OUTLET.on)")
        print("Ciocattino switch ON = \(isIncludedCiocattino_OUTLET.on)")
        print("Vanilio switch ON = \(isIncludedVanilio_OUTLET.on)")
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

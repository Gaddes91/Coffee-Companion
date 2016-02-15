//
//  AppDelegate.swift
//  Coffee Companion
//
//  Created by Matthew Gaddes on 28/12/2015.
//  Copyright © 2015 Matthew Gaddes. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // Check whether the user has launched the app previously
        if (!NSUserDefaults.standardUserDefaults().boolForKey("firstlaunch1.0")) {

            // This code will be executed only once.
            // If the user has NOT launched the app previously, then we must initialise and populate the Core Data database
            
            let entityDescription = NSEntityDescription.entityForName("Coffee", inManagedObjectContext: self.managedObjectContext)
            
            // Create new entity for each type of coffee. Assign name for each individual coffee. Quantity is given a default value of 0.
            // Insert new values (coffee types) into Managed Object Context
            // Intenso
            let arpeggio = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                arpeggio.setValue("Arpeggio", forKey: "name")
            
            let dharkan = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                dharkan.setValue("Dharkan", forKey: "name")
            
            let kazaar = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                kazaar.setValue("Kazaar", forKey: "name")
            
            let ristretto = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                ristretto.setValue("Ristretto", forKey: "name")
            
            let roma = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                roma.setValue("Roma", forKey: "name")
            
            // Espresso
            let capriccio = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                capriccio.setValue("Capriccio", forKey: "name")
            
            let cosi = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                cosi.setValue("Cosi", forKey: "name")
            
            let livanto = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                livanto.setValue("Livanto", forKey: "name")
            
            let volluto = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                volluto.setValue("Volluto", forKey: "name")
            
            // Pure Origin
            let indriya = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                indriya.setValue("Indriya", forKey: "name")
            
            let rosabaya = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                rosabaya.setValue("Rosabaya", forKey: "name")
            
            let dulsao = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                dulsao.setValue("Dulsao", forKey: "name")
            
            let bukeela = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                bukeela.setValue("Bukeela", forKey: "name")
            
            // Lungo
            let fortissioLungo = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                fortissioLungo.setValue("Fortissio Lungo", forKey: "name")
            
            let vivaltoLungo = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                vivaltoLungo.setValue("Vivalto Lungo", forKey: "name")
            
            let linizioLungo = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                linizioLungo.setValue("Linizio Lungo", forKey: "name")
            
            // Decaffeinato
            let arpeggioDecaffeinato = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                arpeggioDecaffeinato.setValue("Decaffeinato Arpeggio", forKey: "name")
            
            let vollutoDecaffeinato = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                vollutoDecaffeinato.setValue("Decaffeinato Volluto", forKey: "name")
            
            let vivaltoLungoDecaffeinato = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                vivaltoLungoDecaffeinato.setValue("Decaffeinato Vivalto Lungo", forKey: "name")
            
            let intensoDecaffeinato = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                intensoDecaffeinato.setValue("Decaffeinato Intenso", forKey: "name")
            
            // Variations
            let ciocattino = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                ciocattino.setValue("Ciocattino", forKey: "name")
            
            let vanilio = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                vanilio.setValue("Vanilio", forKey: "name")
            
            let caramelito = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                caramelito.setValue("Caramelito", forKey: "name")
            
            saveContext() // Save all new objects
            
            // Print to console and change bool value to "true"
            print("This is the first launch!")
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "firstlaunch1.0")
            NSUserDefaults.standardUserDefaults().synchronize();
        } else {
            
//            // MARK: - Load everything from CoreData
//            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//            let managedContext = appDelegate.managedObjectContext
//            
//            let request = NSFetchRequest(entityName: "Coffee") // Ask database to perform a request on the "Coffee" table
//            request.returnsObjectsAsFaults = false // Prevent CoreData from returning objects as faults
//            
//            do { // Execute fetch request in a safe way
//                let results: NSArray = try managedContext.executeFetchRequest(request)
//                
//                if results.count > 0 { // very basic error handling
//                    for res in results {
//                        print(res)
//                    }
//                } else {
//                    print("\(results.count) results returned - Potential Error")
//                }
//            } catch let error as NSError {
//                print("Could not fetch \(error), \(error.userInfo)")
//            }
//            // MARK: -
            
            print("This is NOT the first launch")
        }
        
        return true
    }
    
//    // This is un-necessary since we are calling saveContext() - see above
//    func saveCoreDataObject(objectName: AnyObject) {
//        do {
//            try objectName.managedObjectContext?.save()
//        } catch {
//            print(error)
//        }
//    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - Core Data stack
    
    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "Me.Coffee_Companion" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("Coffee_Companion", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort() // TODO: implement proper error handling
            }
        }
    }

}


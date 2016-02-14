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
            
            // Create new entity for each type of coffee. For each individual coffee, assign name correctly and ensure quantity = 0
            // MARK: New coffee types should be added here as/when necessary
            // TODO: Remove this array and just type names into initialisers below!!!
            let coffeeNames = [
                
                // Intenso
                "Arpeggio",
                "Dharkan",
                "Kazaar",
                "Ristretto",
                "Roma",
                
                // Espresso
                "Capriccio",
                "Cosi",
                "Livanto",
                "Volluto",
                
                // Pure Origin
                "Indriya from India",
                "Rosabaya de Colombia",
                "Dulsao do Brasil",
                "Bukeela ka Ethiopia",
                
                // Lungo
                "Fortissio Lungo",
                "Vivalto Lungo",
                "Linizio Lungo",
                
                // Decaffeinato
                "Decaffeinato Arpeggio",
                "Decaffeinato Volluto",
                "Decaffeinato Vivalto Lungo",
                "Decaffeinato Intenso",
                
                // Variations
                "Ciocattino",
                "Vanilio",
                "Caramelito",
            ]
            
            // Insert new values (coffee types) into Managed Object Context
            // Intenso
            let arpeggio = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                arpeggio.setValue(coffeeNames[0], forKey: "name") // coffeeNames[0] = "Arpeggio"
                arpeggio.setValue(0, forKey: "quantity")
            
            let dharkan = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                dharkan.setValue(coffeeNames[1], forKey: "name") // coffeeNames[1] = "Dharkan"
                dharkan.setValue(0, forKey: "quantity")
            
            let kazaar = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                kazaar.setValue(coffeeNames[2], forKey: "name") // coffeeNames[2] = "Kazaar"
                kazaar.setValue(0, forKey: "quantity")
            
            let ristretto = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                ristretto.setValue(coffeeNames[3], forKey: "name") // coffeeNames[3] = "Ristretto"
                ristretto.setValue(0, forKey: "quantity")
            
            let roma = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                roma.setValue(coffeeNames[4], forKey: "name") // coffeeNames[4] = "Roma"
                roma.setValue(0, forKey: "quantity")
            
            // Espresso
            let capriccio = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                capriccio.setValue(coffeeNames[5], forKey: "name") // coffeeNames[5] = "Capriccio"
                capriccio.setValue(0, forKey: "quantity")
            
            let cosi = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                cosi.setValue(coffeeNames[6], forKey: "name") // coffeeNames[6] = "Cosi"
                cosi.setValue(0, forKey: "quantity")
            
            let livanto = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                livanto.setValue(coffeeNames[7], forKey: "name") // coffeeNames[7] = "Livanto"
                livanto.setValue(0, forKey: "quantity")
            
            let volluto = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                volluto.setValue(coffeeNames[8], forKey: "name") // coffeeNames[8] = "Volluto"
                volluto.setValue(0, forKey: "quantity")
            
            // Pure Origin
            let indriya = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                indriya.setValue(coffeeNames[9], forKey: "name") // coffeeNames[9] = "Indriya"
                indriya.setValue(0, forKey: "quantity")
            
            let rosabaya = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                rosabaya.setValue(coffeeNames[10], forKey: "name") // coffeeNames[10] = "Rosabaya"
                rosabaya.setValue(0, forKey: "quantity")
            
            let dulsao = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                dulsao.setValue(coffeeNames[11], forKey: "name") // coffeeNames[11] = "Dulsao"
                dulsao.setValue(0, forKey: "quantity")
            
            let bukeela = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                bukeela.setValue(coffeeNames[12], forKey: "name") // coffeeNames[12] = "Bukeela"
                bukeela.setValue(0, forKey: "quantity")
            
            // Lungo
            let fortissioLungo = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                fortissioLungo.setValue(coffeeNames[13], forKey: "name") // coffeeNames[13] = "Fortissio Lungo"
                fortissioLungo.setValue(0, forKey: "quantity")
            
            let vivaltoLungo = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                vivaltoLungo.setValue(coffeeNames[14], forKey: "name") // coffeeNames[14] = "Vivalto Lungo"
                vivaltoLungo.setValue(0, forKey: "quantity")
            
            let linizioLungo = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                linizioLungo.setValue(coffeeNames[15], forKey: "name") // coffeeNames[15] = "Linizio Lungo"
                linizioLungo.setValue(0, forKey: "quantity")
            
            // Decaffeinato
            let arpeggioDecaffeinato = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                arpeggioDecaffeinato.setValue(coffeeNames[16], forKey: "name") // coffeeNames[16] = "Decaffeinato Arpeggio"
                arpeggioDecaffeinato.setValue(0, forKey: "quantity")
            
            let vollutoDecaffeinato = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                vollutoDecaffeinato.setValue(coffeeNames[17], forKey: "name") // coffeeNames[17] = "Decaffeinato Volluto"
                vollutoDecaffeinato.setValue(0, forKey: "quantity")
            
            let vivaltoLungoDecaffeinato = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                vivaltoLungoDecaffeinato.setValue(coffeeNames[18], forKey: "name") // coffeeNames[18] = "Decaffeinato Vivalto Lungo"
                vivaltoLungoDecaffeinato.setValue(0, forKey: "quantity")
            
            let intensoDecaffeinato = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                intensoDecaffeinato.setValue(coffeeNames[19], forKey: "name") // coffeeNames[19] = "Decaffeinato Intenso"
                intensoDecaffeinato.setValue(0, forKey: "quantity")
            
            // Variations
            let ciocattino = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                ciocattino.setValue(coffeeNames[20], forKey: "name") // coffeeNames[20] = "Ciocattino"
                ciocattino.setValue(0, forKey: "quantity")
            
            let vanilio = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                vanilio.setValue(coffeeNames[21], forKey: "name") // coffeeNames[21] = "Vanilio"
                vanilio.setValue(0, forKey: "quantity")
            
            let caramelito = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                caramelito.setValue(coffeeNames[22], forKey: "name") // coffeeNames[22] = "Caramelito"
                caramelito.setValue(0, forKey: "quantity")
            
            print("\(coffeeNames)")
            
            // Print to console and change bool value to "true"
            print("This is the first launch!")
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "firstlaunch1.0")
            NSUserDefaults.standardUserDefaults().synchronize();
        } else {
            
            // TODO: Load everything from CoreData here!
            
            
            print("This is NOT the first launch")
        }
        
        return true
    }

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
                abort()
            }
        }
    }

}


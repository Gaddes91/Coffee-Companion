//
//  Model.swift
//  Coffee Companion
//
//  Created by Matthew Gaddes on 29/12/2015.
//  Copyright © 2015 Matthew Gaddes. All rights reserved.
//

import Foundation
import UIKit // This must be imported to work with UIImage

// Dictionary to hold coffee types
var coffees = [Coffee]()

struct Coffee { // Defines the attributes a coffee must have
    var name: String
    var intensity: Int
    var size: String
    var aroma: String
    var notes: String
    var quantity: Int
    var podColour: String // Should this be UIColor?
    var icon: UIImage
    
    init (name: String, intensity: Int, size: String, aroma: String, notes: String, quantity: Int, podColour: String, icon: UIImage) {
        self.name = name
        self.intensity = intensity
        self.size = size
        self.aroma = aroma
        self.notes = notes
        self.quantity = quantity
        self.podColour = podColour
        self.icon = icon
        
        // Populate array with coffee types
        // Each coffee type in this array will have an number associated with it. This number is dependent upon the order in which the coffees are initialised.
        coffees.append(self)
    }
}



class Model
{
    private var dictionary = [String:Coffee]() // Dict to hold coffee types. Key = coffee name.
    var coffeeNames = [String]()
    var coffeeDetails = [Coffee]()
    
    init () {
        
        // TODO: quantity for all coffees should be 0 when app first loads
        
        // Initialise types of coffee
        dictionary["Cosi"] = Coffee(name: "Cosi", intensity: 4, size: "Espresso (40ml)", aroma: "Fruity", notes: "Lightly toasted cereal and fruity notes", quantity: 10, podColour: "Brown", icon: UIImage(named:"Cosi.png")!)
        dictionary["Roma"] = Coffee(name: "Roma", intensity: 8, size: "Espresso (40ml)", aroma: "Intense", notes: "Sweet, woody notes and a full, lasting taste", quantity: 8, podColour: "Dark Brown", icon: UIImage(named:"Roma.png")!)
        dictionary["Arpeggio"] = Coffee(name: "Arpeggio", intensity: 9, size: "Espresso (40ml)", aroma: "Intense", notes: "Strong character and intense body, enhanced by cocoa notes", quantity: 15, podColour: "Purple", icon: UIImage(named:"Arpeggio.png")!)
        dictionary["Ristretto"] = Coffee(name: "Ristretto", intensity: 10, size: "Espresso (40ml)", aroma: "Intense", notes: "Full-bodied, intense espresso with a subtle, fruity note", quantity: 13, podColour: "Black", icon: UIImage(named:"Ristretto.png")!)
        dictionary["Volluto"] = Coffee(name: "Volluto", intensity: 4, size: "Espresso (40ml)", aroma: "Balanced", notes: "Sweet and biscuity flavours", quantity: 7, podColour: "Yellow", icon: UIImage(named:"Volluto.png")!)
    
        // Populate 2No. arrays
        // One will hold the name of each coffee, in order
        // One will hold all other data, in order
        // These arrays can then be accessed using subscript syntax
        for (key, value) in dictionary {
            coffeeNames.append(key)
            coffeeDetails.append(value)
        }
    }
}






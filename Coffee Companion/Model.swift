//
//  Model.swift
//  Coffee Companion
//
//  Created by Matthew Gaddes on 29/12/2015.
//  Copyright © 2015 Matthew Gaddes. All rights reserved.
//

import Foundation

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
    //    var icon: UIImage
    
    init (name: String, intensity: Int, size: String, aroma: String, notes: String, quantity: Int, podColour: String) {
        self.name = name
        self.intensity = intensity
        self.size = size
        self.aroma = aroma
        self.notes = notes
        self.quantity = quantity
        self.podColour = podColour
        
        // Populate array with coffee types
        // Each coffee type in this array will have an number associated with it. This number is dependent upon the order in which the coffees are initialised.
        coffees.append(self)
    }
}

// Initialise types of coffee
var cosi = Coffee(name: "Cosi", intensity: 4, size: "Espresso (40ml)", aroma: "Fruity", notes: "Lightly toasted cereal and fruity notes", quantity: 10, podColour: "Brown")
var roma = Coffee(name: "Roma", intensity: 8, size: "Espresso (40ml)", aroma: "Intense", notes: "Sweet, woody notes and a full, lasting taste", quantity: 10, podColour: "Dark Brown")

class Model
{
    let array = coffees // Copy array of coffee types
}






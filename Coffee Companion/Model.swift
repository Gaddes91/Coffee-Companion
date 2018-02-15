//
//  Model.swift
//  Coffee Companion
//
//  Created by Matthew Gaddes on 29/12/2015.
//  Copyright © 2015 Matthew Gaddes. All rights reserved.
//

import Foundation
import UIKit // This must be imported to work with UIImage
import CoreData

// Dictionary to hold coffee types
var coffees = [Coffee]()

struct Coffee { // Defines the attributes a coffee must have
    let name: String
    // TODO: Delete the comment below
    // This is an optional, because the function loadQuantityFromDataModel uses "if let" to assign the coffee name (this will fail if the current category is empty - when the user deselects all coffees in a particular category)
    let intensity: Int
    let size: String
    let aroma: String
    let notes: String
    let icon: UIImage
    let isIncludedSwitchName: String
    var isIncluded: Bool
    let orderingNo: Int
    
    init (name: String, intensity: Int, size: String, aroma: String, notes: String, icon: UIImage, isIncludedSwitchName: String, isIncluded: Bool, orderingNo: Int) {
        self.name = name
        self.intensity = intensity
        self.size = size
        self.aroma = aroma
        self.notes = notes
        self.icon = icon
        self.isIncludedSwitchName = isIncludedSwitchName
        self.isIncluded = isIncluded
        self.orderingNo = orderingNo
        
        // Populate array with coffee types
        // Each coffee type in this array will have a number associated with it. This number is dependent upon the order in which the coffees are initialised.
        coffees.append(self) // MARK: Is there any point in this?
    }
}

class Model
{
    
    // TODO: 
    
//    var intensoArray = [Coffee]()
//    var espressoArray = [Coffee]()
//    var pureOriginArray = [Coffee]()
//    var lungoArray = [Coffee]()
//    var decaffeinatoArray = [Coffee]()
//    var variationsArray = [Coffee]()
    
    var coffeeNames = [String]() // is this reqd now that we've changed from array to dict?
    var coffeeDetails = [Coffee]() // is this reqd now that we've changed from array to dict?
    
    var intensoDict = [String : Coffee]()
    var espressoDict = [String : Coffee]()
    var pureOriginDict = [String : Coffee]()
    var lungoDict = [String : Coffee]()
    var decaffeinatoDict = [String : Coffee]()
    var variationsDict = [String : Coffee]()
    
    // Arrays (to be used with UIScrollView)
//    var intensoArray = [Coffee]() // Should these be declared with "let" when needed? This depends if we will need to mutate the arrays later on. See below...
//    var espressoArray = [Coffee]()
//    var pureOriginArray = [Coffee]()
//    var lungoArray = [Coffee]()
//    var decaffeinatoArray = [Coffee]()
//    var variationsArray = [Coffee]()
    
    init () {
        
        // Initialise types of coffee
        // Intenso
//        intensoArray.append(Coffee(name: "Arpeggio", intensity: 9, size: "Espresso (40ml)", aroma: "Intense", notes: "Strong character and intense body, enhanced by cocoa notes", icon: UIImage(named:"Arpeggio.png")!, isIncludedSwitchName: "isIncluded_Arpeggio"))
//        intensoArray.append(Coffee(name: "Dharkan", intensity: 11, size: "Espresso (40ml)", aroma: "Intense", notes: "Hints of bitter cocoa powder and toasted cereals expressed through a silky and velvety texture", icon: UIImage(named:"Dharkan.png")!, isIncludedSwitchName: "isIncluded_Dharkan"))
//        intensoArray.append(Coffee(name: "Kazaar", intensity: 12, size: "Espresso (40ml)", aroma: "Intense", notes: "Powerful bitterness and notes of pepper, balanced by a full and creamy texture", icon: UIImage(named:"Kazaar.png")!, isIncludedSwitchName: "isIncluded_Kazaar"))
//        intensoArray.append(Coffee(name: "Ristretto", intensity: 10, size: "Espresso (40ml)", aroma: "Intense", notes: "Full-bodied, intense espresso with a subtle, fruity note", icon: UIImage(named:"Ristretto.png")!, isIncludedSwitchName: "isIncluded_Ristretto"))
//        intensoArray.append(Coffee(name: "Roma", intensity: 8, size: "Espresso (40ml)", aroma: "Intense", notes: "Sweet, woody notes and a full, lasting taste", icon: UIImage(named:"Roma.png")!, isIncludedSwitchName: "isIncluded_Roma"))
        
        // Intenso
        intensoDict["Arpeggio"] = Coffee(name: "Arpeggio", intensity: 9, size: "Espresso (40ml)", aroma: "Intense", notes: "Strong character and intense body, enhanced by cocoa notes", icon: UIImage(named:"Arpeggio.png")!, isIncludedSwitchName: "isIncluded_Arpeggio", isIncluded: true, orderingNo: 0)
        intensoDict["Dharkan"] = Coffee(name: "Dharkan", intensity: 11, size: "Espresso (40ml)", aroma: "Intense", notes: "Hints of bitter cocoa powder and toasted cereals expressed through a silky and velvety texture", icon: UIImage(named:"Dharkan.png")!, isIncludedSwitchName: "isIncluded_Dharkan", isIncluded: true, orderingNo: 1)
        intensoDict["Kazaar"] = Coffee(name: "Kazaar", intensity: 12, size: "Espresso (40ml)", aroma: "Intense", notes: "Powerful bitterness and notes of pepper, balanced by a full and creamy texture", icon: UIImage(named:"Kazaar.png")!, isIncludedSwitchName: "isIncluded_Kazaar", isIncluded: true, orderingNo: 2)
        intensoDict["Ristretto"] = Coffee(name: "Ristretto", intensity: 10, size: "Espresso (40ml)", aroma: "Intense", notes: "Full-bodied, intense espresso with a subtle, fruity note", icon: UIImage(named:"Ristretto.png")!, isIncludedSwitchName: "isIncluded_Ristretto", isIncluded: true, orderingNo: 3)
        intensoDict["Roma"] = Coffee(name: "Roma", intensity: 8, size: "Espresso (40ml)", aroma: "Intense", notes: "Sweet, woody notes and a full, lasting taste", icon: UIImage(named:"Roma.png")!, isIncludedSwitchName: "isIncluded_Roma", isIncluded: true, orderingNo: 4)
        
        // Espresso
//        espressoArray.append(Coffee(name: "Capriccio", intensity: 5, size: "Espresso (40ml)", aroma: "Balanced", notes: "Rich aroma and a strong typical cereal note", icon: UIImage(named:"Capriccio.png")!, isIncludedSwitchName: "isIncluded_Capriccio"))
//        espressoArray.append(Coffee(name: "Cosi", intensity: 4, size: "Espresso (40ml)", aroma: "Fruity", notes: "Lightly toasted cereal and fruity notes", icon: UIImage(named:"Cosi.png")!, isIncludedSwitchName: "isIncluded_Cosi"))
//        espressoArray.append(Coffee(name: "Livanto", intensity: 6, size: "Espresso (40ml)", aroma: "Balanced", notes: "A well-balanced espresso characterised by a roasted caramalised note", icon: UIImage(named:"Livanto.png")!, isIncludedSwitchName: "isIncluded_Livanto"))
//        espressoArray.append(Coffee(name: "Volluto", intensity: 4, size: "Espresso (40ml)", aroma: "Balanced", notes: "Sweet and biscuity flavours", icon: UIImage(named:"Volluto.png")!, isIncludedSwitchName: "isIncluded_Volluto"))
        
        // Espresso
        espressoDict["Capriccio"] = Coffee(name: "Capriccio", intensity: 5, size: "Espresso (40ml)", aroma: "Balanced", notes: "Rich aroma and a strong typical cereal note", icon: UIImage(named:"Capriccio.png")!, isIncludedSwitchName: "isIncluded_Capriccio", isIncluded: true, orderingNo: 0)
        espressoDict["Cosi"] = Coffee(name: "Cosi", intensity: 4, size: "Espresso (40ml)", aroma: "Fruity", notes: "Lightly toasted cereal and fruity notes", icon: UIImage(named:"Cosi.png")!, isIncludedSwitchName: "isIncluded_Cosi", isIncluded: true, orderingNo: 1)
        espressoDict["Livanto"] = Coffee(name: "Livanto", intensity: 6, size: "Espresso (40ml)", aroma: "Balanced", notes: "A well-balanced espresso characterised by a roasted caramalised note", icon: UIImage(named:"Livanto.png")!, isIncludedSwitchName: "isIncluded_Livanto", isIncluded: true, orderingNo: 2)
        espressoDict["Volluto"] = Coffee(name: "Volluto", intensity: 4, size: "Espresso (40ml)", aroma: "Balanced", notes: "Sweet and biscuity flavours", icon: UIImage(named:"Volluto.png")!, isIncludedSwitchName: "isIncluded_Volluto", isIncluded: true, orderingNo: 3)
        
        // Pure Origin
//        pureOriginArray.append(Coffee(name: "Indriya from India", intensity: 10, size: "Espresso (40ml)", aroma: "Intense", notes: "A full-bodied espresso, which has a distinct personality with notes of spices", icon: UIImage(named:"Indriya from India.png")!, isIncludedSwitchName: "isIncluded_Indriya"))
//        pureOriginArray.append(Coffee(name: "Rosabaya de Colombia", intensity: 6, size: "Espresso (40ml)", aroma: "Fruity", notes: "This coffee has a subtle acidity with typical red fruit and winey notes", icon: UIImage(named:"Rosabaya de Colombia.png")!, isIncludedSwitchName: "isIncluded_Rosabaya"))
//        pureOriginArray.append(Coffee(name: "Dulsao do Brasil", intensity: 4, size: "Espresso (40ml)", aroma: "Balanced", notes: "The satiny smooth, elegantly balanced flavor is enhanced with a note of delicately toasted grain", icon: UIImage(named:"Dulsao do Brasil.png")!, isIncludedSwitchName: "isIncluded_Dulsao"))
//        pureOriginArray.append(Coffee(name: "Bukeela ka Ethiopia", intensity: 3, size: "Lungo (110ml)", aroma: "Balanced", notes: "This delicately fresh and floral Pure Origin Lungo reveals unexpectedly wild notes of musk and wood", icon: UIImage(named:"Bukeela ka Ethiopia.png")!, isIncludedSwitchName: "isIncluded_Bukeela"))
        
        // Pure Origin
        pureOriginDict["Indriya"] = Coffee(name: "Indriya from India", intensity: 10, size: "Espresso (40ml)", aroma: "Intense", notes: "A full-bodied espresso, which has a distinct personality with notes of spices", icon: UIImage(named:"Indriya from India.png")!, isIncludedSwitchName: "isIncluded_Indriya", isIncluded: true, orderingNo: 0)
        pureOriginDict["Rosabaya"] = Coffee(name: "Rosabaya de Colombia", intensity: 6, size: "Espresso (40ml)", aroma: "Fruity", notes: "This coffee has a subtle acidity with typical red fruit and winey notes", icon: UIImage(named:"Rosabaya de Colombia.png")!, isIncludedSwitchName: "isIncluded_Rosabaya", isIncluded: true, orderingNo: 1)
        pureOriginDict["Dulsao"] = Coffee(name: "Dulsao do Brasil", intensity: 4, size: "Espresso (40ml)", aroma: "Balanced", notes: "The satiny smooth, elegantly balanced flavor is enhanced with a note of delicately toasted grain", icon: UIImage(named:"Dulsao do Brasil.png")!, isIncludedSwitchName: "isIncluded_Dulsao", isIncluded: true, orderingNo: 2)
        pureOriginDict["Bukeela"] = Coffee(name: "Bukeela ka Ethiopia", intensity: 3, size: "Lungo (110ml)", aroma: "Balanced", notes: "This delicately fresh and floral Pure Origin Lungo reveals unexpectedly wild notes of musk and wood", icon: UIImage(named:"Bukeela ka Ethiopia.png")!, isIncludedSwitchName: "isIncluded_Bukeela", isIncluded: true, orderingNo: 3)
        
        // Lungo
//        lungoArray.append(Coffee(name: "Fortissio Lungo", intensity: 8, size: "Lungo (110ml)", aroma: "Intense", notes: "West Indian Malabar Arabica beans are exposed to monsoon winds after harvest to reveal a distinguished aromatic profile, rich with cereal notes", icon: UIImage(named:"Fortissio Lungo.png")!, isIncludedSwitchName: "isIncluded_FortissioLungo"))
//        lungoArray.append(Coffee(name: "Vivalto Lungo", intensity: 4, size: "Lungo (110ml)", aroma: "Fruity", notes: "Separately roasted South American and East African Arabicas, combining roasted and subtle floral notes", icon: UIImage(named:"Vivalto Lungo.png")!, isIncludedSwitchName: "isIncluded_VivaltoLungo"))
//        lungoArray.append(Coffee(name: "Linizio Lungo", intensity: 4, size: "Lungo (110ml)", aroma: "Balanced", notes: "Split-roasting gives a cereal, malty note typical for the Bourbon variety, while maintaining its mild and smooth character", icon: UIImage(named:"Linizio Lungo.png")!, isIncludedSwitchName: "isIncluded_LinizioLungo"))
        
        // Lungo
        lungoDict["Fortissio"] = Coffee(name: "Fortissio Lungo", intensity: 8, size: "Lungo (110ml)", aroma: "Intense", notes: "West Indian Malabar Arabica beans are exposed to monsoon winds after harvest to reveal a distinguished aromatic profile, rich with cereal notes", icon: UIImage(named:"Fortissio Lungo.png")!, isIncludedSwitchName: "isIncluded_FortissioLungo", isIncluded: true, orderingNo: 0)
        lungoDict["Vivalto"] = Coffee(name: "Vivalto Lungo", intensity: 4, size: "Lungo (110ml)", aroma: "Fruity", notes: "Separately roasted South American and East African Arabicas, combining roasted and subtle floral notes", icon: UIImage(named:"Vivalto Lungo.png")!, isIncludedSwitchName: "isIncluded_VivaltoLungo", isIncluded: true, orderingNo: 1)
        lungoDict["Linizio"] = Coffee(name: "Linizio Lungo", intensity: 4, size: "Lungo (110ml)", aroma: "Balanced", notes: "Split-roasting gives a cereal, malty note typical for the Bourbon variety, while maintaining its mild and smooth character", icon: UIImage(named:"Linizio Lungo.png")!, isIncludedSwitchName: "isIncluded_LinizioLungo", isIncluded: true, orderingNo: 2)
        
        // Decaffeinato
//        decaffeinatoArray.append(Coffee(name: "Decaffeinato Arpeggio", intensity: 9, size: "Espresso (40ml)", aroma: "Intense", notes: "This coffee boasts strong character, intense body and cocoa notes", icon: UIImage(named:"Decaffeinato Arpeggio.png")!, isIncludedSwitchName: "isIncluded_DecafArpeggio"))
//        decaffeinatoArray.append(Coffee(name: "Decaffeinato Volluto", intensity: 4, size: "Espresso (40ml)", aroma: "Fruity", notes: "This coffee reveals sweet and biscuity flavours, reinforced by a hint of acidity and a fruity note", icon: UIImage(named:"Decaffeinato Volluto.png")!, isIncludedSwitchName: "isIncluded_DecafVolluto"))
//        decaffeinatoArray.append(Coffee(name: "Decaffeinato Vivalto Lungo", intensity: 4, size: "Lungo (110ml)", aroma: "Fruity", notes: "This coffee perfectly preserves the complexity of separately roasted South American and East African Arabicas, combining both roasted and subtle floral notes", icon: UIImage(named:"Decaffeinato Vivalto Lungo.png")!, isIncludedSwitchName: "isIncluded_DecafVivalto"))
//        decaffeinatoArray.append(Coffee(name: "Decaffeinato Intenso", intensity: 7, size: "Espresso (40ml)", aroma: "Intense", notes: "A full-bodied espresso with subtle cocoa and roasted cereal notes", icon: UIImage(named:"Decaffeinato Intenso.png")!, isIncludedSwitchName: "isIncluded_DecafIntenso"))
        
        // Decaffeinato
        decaffeinatoDict["DecafArpeggio"] = Coffee(name: "Decaffeinato Arpeggio", intensity: 9, size: "Espresso (40ml)", aroma: "Intense", notes: "This coffee boasts strong character, intense body and cocoa notes", icon: UIImage(named:"Decaffeinato Arpeggio.png")!, isIncludedSwitchName: "isIncluded_DecafArpeggio", isIncluded: true, orderingNo: 0)
        decaffeinatoDict["DecafVolluto"] = Coffee(name: "Decaffeinato Volluto", intensity: 4, size: "Espresso (40ml)", aroma: "Fruity", notes: "This coffee reveals sweet and biscuity flavours, reinforced by a hint of acidity and a fruity note", icon: UIImage(named:"Decaffeinato Volluto.png")!, isIncludedSwitchName: "isIncluded_DecafVolluto", isIncluded: true, orderingNo: 1)
        decaffeinatoDict["DecafVivalto"] = Coffee(name: "Decaffeinato Vivalto Lungo", intensity: 4, size: "Lungo (110ml)", aroma: "Fruity", notes: "This coffee perfectly preserves the complexity of separately roasted South American and East African Arabicas, combining both roasted and subtle floral notes", icon: UIImage(named:"Decaffeinato Vivalto Lungo.png")!, isIncludedSwitchName: "isIncluded_DecafVivalto", isIncluded: true, orderingNo: 2)
        decaffeinatoDict["DecafIntenso"] = Coffee(name: "Decaffeinato Intenso", intensity: 7, size: "Espresso (40ml)", aroma: "Intense", notes: "A full-bodied espresso with subtle cocoa and roasted cereal notes", icon: UIImage(named:"Decaffeinato Intenso.png")!, isIncludedSwitchName: "isIncluded_DecafIntenso", isIncluded: true, orderingNo: 3)
        
        // Variations
//        variationsArray.append(Coffee(name: "Ciocattino", intensity: 6, size: "Espresso (40ml)", aroma: "Chocolate", notes: "Dark and bitter chocolate notes meet the caramelised roast of the Livanto Grand Cru. A rich combination reminiscent of a square of dark chocolate", icon: UIImage(named:"Ciocattino.png")!, isIncludedSwitchName: "isIncluded_Ciocattino"))
//        variationsArray.append(Coffee(name: "Vanilio", intensity: 6, size: "Espresso (40ml)", aroma: "Vanilla", notes: "A balanced harmony between the rich and the velvety aromas of vanilla and the mellow flavour of the Livanto Grand Cru. A blend distinguished by its full flavour, infinitely smooth and silky on the palate", icon: UIImage(named:"Vanilio.png")!, isIncludedSwitchName: "isIncluded_Vanilio"))
//        variationsArray.append(Coffee(name: "Caramelito", intensity: 6, size: "Espresso (40ml)", aroma: "Caramel", notes: "The sweet flavour of caramel softens the roasted notes of the Livanto Grand Cru. This delicate gourmet marriage evokes the creaminess of soft toffee", icon: UIImage(named:"Caramelito.png")!, isIncludedSwitchName: "isIncluded_Caramelito"))
        
        // Variations
        variationsDict["Ciocattino"] = Coffee(name: "Ciocattino", intensity: 6, size: "Espresso (40ml)", aroma: "Chocolate", notes: "Dark and bitter chocolate notes meet the caramelised roast of the Livanto Grand Cru. A rich combination reminiscent of a square of dark chocolate", icon: UIImage(named:"Ciocattino.png")!, isIncludedSwitchName: "isIncluded_Ciocattino", isIncluded: true, orderingNo: 0)
        variationsDict["Vanilio"] = Coffee(name: "Vanilio", intensity: 6, size: "Espresso (40ml)", aroma: "Vanilla", notes: "A balanced harmony between the rich and the velvety aromas of vanilla and the mellow flavour of the Livanto Grand Cru. A blend distinguished by its full flavour, infinitely smooth and silky on the palate", icon: UIImage(named:"Vanilio.png")!, isIncludedSwitchName: "isIncluded_Vanilio", isIncluded: true, orderingNo: 1)
        variationsDict["Caramelito"] = Coffee(name: "Caramelito", intensity: 6, size: "Espresso (40ml)", aroma: "Caramel", notes: "The sweet flavour of caramel softens the roasted notes of the Livanto Grand Cru. This delicate gourmet marriage evokes the creaminess of soft toffee", icon: UIImage(named:"Caramelito.png")!, isIncludedSwitchName: "isIncluded_Caramelito", isIncluded: true, orderingNo: 2)
        
        // Populate arrays with names and details
//        populateNamesAndDetails(intensoArray)
//        populateNamesAndDetails(espressoArray)
//        populateNamesAndDetails(pureOriginArray)
//        populateNamesAndDetails(lungoArray)
//        populateNamesAndDetails(decaffeinatoArray)
//        populateNamesAndDetails(variationsArray)
    }
    
    func populateNamesAndDetails(_ inputArray: [Coffee]) { // MARK: Is this function required??
        
        // Populate 2No. arrays
        // One will hold the name of each coffee, in order
        // One will hold all other data, in order
        // These arrays can then be accessed using subscript syntax
        
        for item in inputArray {
            coffeeNames.append(item.name)
            coffeeDetails.append(item)
        }
    }
}






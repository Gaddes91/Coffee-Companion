//
//  UIPickerViewController.swift
//  Coffee Companion
//
//  Created by Matthew Gaddes on 02/01/2016.
//  Copyright © 2016 Matthew Gaddes. All rights reserved.
//

import UIKit

class UIPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var picker: UIPickerView!
    
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
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch row {
        case 0:
            print("Intenso!")
            
        case 1:
            print("Espresso!")
        case 2:
            print("Pure Origin!")
        case 3:
            print("Lungo!")
        case 4:
            print("Decaffeinato!")
        case 5:
            print("Variations!")
        default:
            print("default case")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data
        picker.delegate = self
        picker.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

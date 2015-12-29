//
//  ViewController.swift
//  Coffee Companion
//
//  Created by Matthew Gaddes on 28/12/2015.
//  Copyright © 2015 Matthew Gaddes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var numberOfRemainingPods: UILabel!
    
    let model = Model()
    
    @IBAction func addSleeve(sender: UIButton)
    {
        if let num = Int(numberOfRemainingPods.text!) { // Check label.text can be converted to Int
            
            numberOfRemainingPods.text = String(num + 10)
        }
    }
    
    @IBAction func removePod(sender: UIButton)
    {
        if let num = Int(numberOfRemainingPods.text!) { // Check label.text can be converted to Int
            
            if num > 0 {
                numberOfRemainingPods.text = String(num - 1)
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    


}


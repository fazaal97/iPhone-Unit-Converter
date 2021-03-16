//
//  SettingViewController.swift
//  iPhone Unit Converter Application
//
//  Created by Fazal on 2021-03-16.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var sliderDecimal: UISlider!
    @IBOutlet weak var labelDecimal: UILabel!
    
    var decimalPlace:Int = 0
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let value = UserDefaults.standard.value(forKey: "decimalPoint") as? Double {
            sliderDecimal.value = Float(value)
            labelDecimal.text = String(describing: Int(value))
        }
        
    }
    
    
    @IBAction func sliderChange(_ sender: UISlider) {
        labelDecimal.text = String(describing: Int(sender.value))
        
        // save the changed value to UserDefaults
        UserDefaults.standard.setValue(sender.value, forKey: "decimalPoint")
        
        //Post to Notification Center that the value has changed
        NotificationCenter.default.post(Notification.init(name: Notification.Name("stepperDidChangeValue")))
    }
    
    
}

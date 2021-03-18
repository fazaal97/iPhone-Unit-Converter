//
//  TemperatureViewController.swift
//  iPhone Unit Converter Application
//
//  Created by Fazal on 2021-03-12.
//
import Foundation
import UIKit

class TemperatureViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var celsiusTextField: UITextField!
    @IBOutlet weak var fahrenheitTextField: UITextField!
    @IBOutlet weak var kelvinTextField: UITextField!
    @IBOutlet weak var CustomKeyboard: CustomKeyboard!
    
    var temp : Temperature = Temperature(celsius: 0.0, farenheit: 0.0, kelvin: 0.0)
    
    var decimalpoint:Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.assignDelegate()
        
        if let value = UserDefaults.standard.value(forKey: "decimalPoint") as? Double {
            decimalpoint = Int(value)
        }
        //subscribe to changes
        NotificationCenter.default.addObserver(self, selector: #selector(stepperDidChange), name: Notification.Name("stepperDidChangeValue"), object: nil)
    }
    
    @objc func stepperDidChange() {
        if let value = UserDefaults.standard.value(forKey: "decimalPoint") as? Double {
            decimalpoint = Int(value)
        }
    }
    
    func assignDelegate() {
        celsiusTextField.delegate = self
        fahrenheitTextField.delegate = self
        kelvinTextField.delegate = self
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        CustomKeyboard.activeTextField = textField
    }
    
    @IBAction func celsiusChnage(_ sender: UITextField) {
        
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            temp.celsius = doubleTFValue
            temp.farenheit = (doubleTFValue * 9/5) + 32
            temp.kelvin = doubleTFValue + 273.15
            
            fahrenheitTextField.text = "\(String(format: "%.\(decimalpoint)f",temp.farenheit))"
            kelvinTextField.text = "\(String(format: "%.\(decimalpoint)f",temp.kelvin))"
            
            
        }else{
            resetFields()
        }
        
    }
    
    
    @IBAction func fahrenheitChnage(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            temp.farenheit = doubleTFValue
            temp.celsius = (doubleTFValue - 32) * 5/9
            temp.kelvin = (doubleTFValue - 32) * 5/9 + 273.15
            
            celsiusTextField.text = "\(String(format: "%.\(decimalpoint)f",temp.celsius))"
            kelvinTextField.text = "\(String(format: "%.\(decimalpoint)f",temp.kelvin))"
            
            
        }else{
            resetFields()
        }
        
        
    }
    
    @IBAction func kelvinChange(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            temp.kelvin = doubleTFValue
            temp.celsius = doubleTFValue - 273.15
            temp.farenheit = (doubleTFValue - 273.15) * 9/5 + 32
            
            celsiusTextField.text = "\(String(format: "%.\(decimalpoint)f",temp.celsius))"
            fahrenheitTextField.text = "\(String(format: "%.\(decimalpoint)f",temp.farenheit))"
            
            
        }else{
            resetFields()
        }
        
    }
    
    
    func resetFields() -> () {
        celsiusTextField.text = ""
        fahrenheitTextField.text = ""
        kelvinTextField.text = ""
        
    }
    
    @IBAction func onSave(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        let savedString = "\(String(format: "%.\(decimalpoint)f",temp.celsius)) celcius = \(String(format: "%.\(decimalpoint)f",temp.farenheit)) farenhiet = \(String(format: "%.\(decimalpoint)f",temp.kelvin)) kelvin"
        var arr = defaults.array(forKey: "TempHistory") as? [String] ?? []
        if arr.count >= 5 {
            arr = Array(arr.suffix(5 - 1))
        }
        arr.append(savedString)
        defaults.set(arr, forKey: "TempHistory")
        let alert = UIAlertController(title: "Success", message: "The conversions saved successfully!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func resetFields(_ sender: UIButton) {
        resetFields()
    }
    
}

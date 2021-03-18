//  WeightViewController.swift
//  iPhone Unit Converter Application
//
//  Created by Fazal on 2021-03-12.
//
import Foundation
import UIKit



class WeightViewController: UIViewController , UITextFieldDelegate {
    
    
    @IBOutlet weak var kgTF: UITextField!
    @IBOutlet weak var poundTF: UITextField!
    @IBOutlet weak var ounceTF: UITextField!
    @IBOutlet weak var stoneTF: UITextField!
    @IBOutlet weak var sPoundTF: UITextField!
    @IBOutlet weak var gramTF: UITextField!
    @IBOutlet weak var customKeyboard: CustomKeyboard!
    
    
    let weight : Weight = Weight(kg: 0.0, pound: 0.0, ounce: 0.0, gram: 0.0, stone: 0.0, stonePound: 0.0)
    
    var decimalpoint:Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.assignDelegates()
        
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
    
    func assignDelegates() {
        kgTF.delegate = self
        poundTF.delegate = self
        ounceTF.delegate = self
        stoneTF.delegate = self
        sPoundTF.delegate = self
        gramTF.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        customKeyboard.activeTextField = textField
    }
    
    
    @IBAction func kgChange(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            let stonePound: Double = doubleTFValue / 6.35
            
            weight.kg = doubleTFValue
            weight.pound = (doubleTFValue *  2.205)
            weight.gram = (doubleTFValue * 1000)
            weight.ounce = (doubleTFValue * 35.274)
            weight.stone = stonePound.rounded(.towardZero)
            weight.stonePound = stonePound.truncatingRemainder(dividingBy: 1) * 14
            
            ounceTF.text = "\(String(format: "%.\(decimalpoint)f", weight.ounce))"
            poundTF.text = "\(String(format: "%.\(decimalpoint)f",weight.pound))"
            gramTF.text = "\(weight.gram)"
            stoneTF.text = "\(String(format: "%.\(decimalpoint)f",weight.stone))"
            sPoundTF.text = "\(String(format: "%.\(decimalpoint)f",weight.stonePound))"
            
        }else{
            resetFields()
        }
        
    }
    
    @IBAction func gramChange(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            let stonePound: Double = doubleTFValue / 6350
            
            weight.kg = doubleTFValue / 1000
            weight.pound = doubleTFValue / 454
            weight.gram = doubleTFValue
            weight.ounce = (doubleTFValue / 28.35)
            weight.stone = stonePound.rounded(.towardZero)
            weight.stonePound = stonePound.truncatingRemainder(dividingBy: 1) * 14
            
            ounceTF.text = "\(String(format: "%.\(decimalpoint)f", weight.ounce))"
            poundTF.text = "\(String(format: "%.\(decimalpoint)f",weight.pound))"
            kgTF.text = "\(String(format: "%.\(decimalpoint)f",weight.kg))"
            stoneTF.text = "\(String(format: "%.\(decimalpoint)f",weight.stone))"
            sPoundTF.text = "\(String(format: "%.\(decimalpoint)f",weight.stonePound))"
            
        }else{
            resetFields()
        }
    }
    
    
    @IBAction func ounceChnage(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            let stonePound: Double = doubleTFValue / 224
            
            weight.kg = doubleTFValue / 35.274
            weight.pound = doubleTFValue / 16
            weight.gram = doubleTFValue * 28.35
            weight.ounce = doubleTFValue
            weight.stone = stonePound.rounded(.towardZero)
            weight.stonePound = stonePound.truncatingRemainder(dividingBy: 1) * 14
            
            gramTF.text = "\(weight.gram)"
            poundTF.text = "\(String(format: "%.\(decimalpoint)f",weight.pound))"
            kgTF.text = "\(String(format: "%.\(decimalpoint)f",weight.kg))"
            stoneTF.text = "\(String(format: "%.\(decimalpoint)f",weight.stone))"
            sPoundTF.text = "\(String(format: "%.\(decimalpoint)f",weight.stonePound))"
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func poundChnage(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            let stonePound: Double = doubleTFValue / 14
            
            weight.kg = doubleTFValue / 2.205
            weight.pound = doubleTFValue
            weight.gram = doubleTFValue * 454
            weight.ounce = doubleTFValue * 16
            weight.stone = stonePound.rounded(.towardZero)
            weight.stonePound = stonePound.truncatingRemainder(dividingBy: 1) * 14
            
            gramTF.text = "\(weight.gram)"
            ounceTF.text = "\(String(format: "%.\(decimalpoint)f", weight.ounce))"
            kgTF.text = "\(String(format: "%.\(decimalpoint)f",weight.kg))"
            stoneTF.text = "\(String(format: "%.\(decimalpoint)f",weight.stone))"
            sPoundTF.text = "\(String(format: "%.\(decimalpoint)f",weight.stonePound))"
            
        }else{
            resetFields()
        }
        
    }
    
    @IBAction func stoneChnage(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            
            weight.kg = doubleTFValue / 6.35
            weight.pound = doubleTFValue * 14
            weight.gram = doubleTFValue * 6350
            weight.ounce = doubleTFValue * 224
            weight.stone = doubleTFValue
            
            gramTF.text = "\(weight.gram)"
            ounceTF.text = "\(String(format: "%.\(decimalpoint)f", weight.ounce))"
            kgTF.text = "\(String(format: "%.\(decimalpoint)f",weight.kg))"
            poundTF.text = "\(String(format: "%.\(decimalpoint)f",weight.pound))"
            sPoundTF.text = "\(String(format: "%.\(decimalpoint)f",weight.stonePound))"
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func stonePoundChnage(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            
            weight.kg = doubleTFValue / 2.205
            weight.pound = doubleTFValue
            weight.gram = doubleTFValue * 454
            weight.ounce = doubleTFValue * 16
            weight.stone = doubleTFValue / 14
            
            gramTF.text = "\(weight.gram)"
            ounceTF.text = "\(String(format: "%.\(decimalpoint)f", weight.ounce))"
            kgTF.text = "\(String(format: "%.\(decimalpoint)f",weight.kg))"
            poundTF.text = "\(String(format: "%.\(decimalpoint)f",weight.pound))"
            stoneTF.text = "\(String(format: "%.\(decimalpoint)f",weight.stone))"
        }
    }
    
    
    func resetFields() -> () {
        gramTF.text = ""
        kgTF.text = ""
        poundTF.text = ""
        ounceTF.text = ""
        stoneTF.text = ""
        sPoundTF.text = ""
    }
    
    @IBAction func onSave(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        let saveWeights = "\(String(format: "%.\(decimalpoint)f",weight.kg)) kg = \(String(format: "%.\(decimalpoint)f",weight.gram)) grams = \(String(format: "%.\(decimalpoint)f", weight.ounce)) ounce = \(String(format: "%.\(decimalpoint)f",weight.stone)) stones and \(String(format: "%.\(decimalpoint)f",weight.stonePound)) pounds = \(String(format: "%.\(decimalpoint)f",weight.pound)) pound "
        var arr = defaults.array(forKey: "WeightHistory") as? [String] ?? []
        if arr.count >= 5 {
            arr = Array(arr.suffix(5 - 1))
        }
        arr.append(saveWeights)
        defaults.set(arr, forKey: "WeightHistory")
        
        let alert = UIAlertController(title: "Success", message: "The conversions saved successfully!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func resetFileds(_ sender: UIButton) {
        resetFields()
    }
    
    
}

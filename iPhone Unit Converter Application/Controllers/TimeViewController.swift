//
//  TImeViewController.swift
//  iPhone Unit Converter Application
//
//  Created by user187743 on 3/17/21.
//

import UIKit

class TimeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var hourTF: UITextField!
    @IBOutlet weak var minuteTF: UITextField!
    @IBOutlet weak var secondTF: UITextField!
    @IBOutlet weak var dayTF: UITextField!
    @IBOutlet weak var weekTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var customKeyboard: CustomKeyboard!
    
    
    var time : Time = Time(hour: 0.0, minute: 0.0, second: 0.0, day: 0.0, week: 0.0, month: 0.0)
    
    var decimalpoint:Int = 2
    
    override func viewDidLoad() {
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
        hourTF.delegate = self
        minuteTF.delegate = self
        secondTF.delegate = self
        dayTF.delegate = self
        weekTF.delegate = self
        monthTF.delegate = self
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        customKeyboard.activeTextField = textField
    }
    
    @IBAction func hourChange(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            time.hour = doubleTFValue
            time.minute = doubleTFValue * 60
            time.second = doubleTFValue * 3600
            time.day = doubleTFValue / 24
            time.week = doubleTFValue / 168
            time.month = doubleTFValue / 730
            
            minuteTF.text = "\(String(format: "%.\(decimalpoint)f",time.minute))"
            secondTF.text = "\(String(format: "%.\(decimalpoint)f",time.second))"
            dayTF.text = "\(String(format: "%.\(decimalpoint)f",time.day))"
            weekTF.text = "\(String(format: "%.\(decimalpoint)f",time.week))"
            monthTF.text = "\(String(format: "%.\(decimalpoint)f",time.month))"
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func minuteChnage(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            time.hour = doubleTFValue / 1440
            time.minute = doubleTFValue
            time.second = doubleTFValue * 60
            time.day = doubleTFValue / 1440
            time.week = doubleTFValue / 10080
            time.month = doubleTFValue / 43800
            
            hourTF.text = "\(String(format: "%.\(decimalpoint)f",time.hour))"
            secondTF.text = "\(String(format: "%.\(decimalpoint)f",time.second))"
            dayTF.text = "\(String(format: "%.\(decimalpoint)f",time.day))"
            weekTF.text = "\(String(format: "%.\(decimalpoint)f",time.week))"
            monthTF.text = "\(String(format: "%.\(decimalpoint)f",time.month))"
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func secondChnage(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            time.hour = doubleTFValue / 3600
            time.minute = doubleTFValue / 60
            time.second = doubleTFValue
            time.day = doubleTFValue / 86400
            time.week = doubleTFValue / 604800
            time.month = doubleTFValue / 2.628e+6
            
            hourTF.text = "\(String(format: "%.\(decimalpoint)f",time.hour))"
            minuteTF.text = "\(String(format: "%.\(decimalpoint)f",time.minute))"
            dayTF.text = "\(String(format: "%.\(decimalpoint)f",time.day))"
            weekTF.text = "\(String(format: "%.\(decimalpoint)f",time.week))"
            monthTF.text = "\(String(format: "%.\(decimalpoint)f",time.month))"
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func dayChnage(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            time.hour = doubleTFValue * 24
            time.minute = doubleTFValue * 1440
            time.second = doubleTFValue * 86400
            time.day = doubleTFValue
            time.week = doubleTFValue / 7
            time.month = doubleTFValue /  30.417
            
            hourTF.text = "\(String(format: "%.\(decimalpoint)f",time.hour))"
            minuteTF.text = "\(String(format: "%.\(decimalpoint)f",time.minute))"
            secondTF.text = "\(String(format: "%.\(decimalpoint)f",time.second))"
            weekTF.text = "\(String(format: "%.\(decimalpoint)f",time.week))"
            monthTF.text = "\(String(format: "%.\(decimalpoint)f",time.month))"
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func weekChnage(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            time.hour = doubleTFValue * 168
            time.minute = doubleTFValue * 10080
            time.second = doubleTFValue * 604800
            time.day = doubleTFValue * 7
            time.week = doubleTFValue
            time.month = doubleTFValue /  4.345
            
            hourTF.text = "\(String(format: "%.\(decimalpoint)f",time.hour))"
            minuteTF.text = "\(String(format: "%.\(decimalpoint)f",time.minute))"
            secondTF.text = "\(String(format: "%.\(decimalpoint)f",time.second))"
            dayTF.text = "\(String(format: "%.\(decimalpoint)f",time.day))"
            monthTF.text = "\(String(format: "%.\(decimalpoint)f",time.month))"
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func monthChange(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            time.hour = doubleTFValue * 730
            time.minute = doubleTFValue * 43800
            time.second = doubleTFValue *  2.628e+6
            time.day = doubleTFValue * 30.417
            time.week = doubleTFValue * 4.345
            time.month = doubleTFValue
            
            hourTF.text = "\(String(format: "%.\(decimalpoint)f",time.hour))"
            minuteTF.text = "\(String(format: "%.\(decimalpoint)f",time.minute))"
            secondTF.text = "\(String(format: "%.\(decimalpoint)f",time.second))"
            dayTF.text = "\(String(format: "%.\(decimalpoint)f",time.day))"
            weekTF.text = "\(String(format: "%.\(decimalpoint)f",time.week))"
            
        }else{
            resetFields()
        }
    }
    
    func resetFields() -> () {
        hourTF.text = ""
        minuteTF.text = ""
        secondTF.text = ""
        dayTF.text = ""
        weekTF.text = ""
        monthTF.text = ""
    }
    
    
    @IBAction func onSave(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        let savedString = "\(String(format: "%.\(decimalpoint)f",time.hour)) hour = \(String(format: "%.\(decimalpoint)f",time.minute)) minute = \(String(format: "%.\(decimalpoint)f",time.second)) seconds = \(String(format: "%.\(decimalpoint)f",time.day)) day = \(String(format: "%.\(decimalpoint)f",time.week)) week = \(String(format: "%.\(decimalpoint)f",time.month)) month"
        
        
        var arr = defaults.array(forKey: "TimeHistory") as? [String] ?? []
        if arr.count >= 5 {
            arr = Array(arr.suffix(5 - 1))
        }
        arr.append(savedString)
        defaults.set(arr, forKey: "TimeHistory")
        
        let alert = UIAlertController(title: "Success", message: "The conversions saved successfully!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func resetTF(_ sender: UIButton) {
        resetFields()
    }
    
}

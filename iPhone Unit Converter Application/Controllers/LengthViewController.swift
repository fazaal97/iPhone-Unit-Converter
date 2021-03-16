//
//  LengthViewController.swift
//  iPhone Unit Converter Application
//
//  Created by Fazal on 2021-03-12.
//

import UIKit

class LengthViewController: UIViewController , UITextFieldDelegate {
    
    @IBOutlet weak var meterTF: UITextField!
    @IBOutlet weak var kmTF: UITextField!
    @IBOutlet weak var mileTF: UITextField!
    @IBOutlet weak var cmTF: UITextField!
    @IBOutlet weak var mmTF: UITextField!
    @IBOutlet weak var yardTF: UITextField!
    @IBOutlet weak var inchTF: UITextField!
    @IBOutlet weak var CustomKeyboard: CustomKeyboard!
    
    let length : Length = Length(meter: 0.0, km: 0.0, mile: 0.0, cm: 0.0, mm: 0.0, yard: 0.0, inch: 0.0)
    var decimalpoint:Int = 0
    
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
        meterTF.delegate = self
        kmTF.delegate = self
        mileTF.delegate = self
        cmTF.delegate = self
        mmTF.delegate = self
        yardTF.delegate = self
        inchTF.delegate = self
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        CustomKeyboard.activeTextField = textField
    }
    
    
    @IBAction func meterChnage(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            length.meter = doubleTFValue
            length.km = doubleTFValue / 1000
            length.mile = doubleTFValue / 1609
            length.cm = doubleTFValue * 100
            length.mm = doubleTFValue * 1000
            length.yard = doubleTFValue * 1.094
            length.inch = doubleTFValue * 39.37
            
            kmTF.text = "\(String(format: "%.\(decimalpoint)f",length.km))"
            mileTF.text = "\(String(format: "%.\(decimalpoint)f",length.mile))"
            cmTF.text = "\(String(format: "%.\(decimalpoint)f",length.cm))"
            mmTF.text = "\(String(format: "%.\(decimalpoint)f",length.mm))"
            yardTF.text = "\(String(format: "%.\(decimalpoint)f",length.yard))"
            inchTF.text = "\(String(format: "%.\(decimalpoint)f",length.inch))"
            
        }else{
            resetFields()
        }
    }
    @IBAction func kmChnage(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            length.meter = doubleTFValue * 1000
            length.km = doubleTFValue
            length.mile = doubleTFValue / 1.609
            length.cm = doubleTFValue * 100000
            length.mm = doubleTFValue * 1000000
            length.yard = doubleTFValue * 1094
            length.inch = doubleTFValue * 39370
            
            meterTF.text = "\(String(format: "%.\(decimalpoint)f",length.meter))"
            mileTF.text = "\(String(format: "%.\(decimalpoint)f",length.mile))"
            cmTF.text = "\(String(format: "%.\(decimalpoint)f",length.cm))"
            mmTF.text = "\(String(format: "%.\(decimalpoint)f",length.mm))"
            yardTF.text = "\(String(format: "%.\(decimalpoint)f",length.yard))"
            inchTF.text = "\(String(format: "%.\(decimalpoint)f",length.inch))"
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func mileChnage(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            length.meter = doubleTFValue * 1609
            length.km = doubleTFValue * 1.609
            length.mile = doubleTFValue
            length.cm = doubleTFValue * 160934
            length.mm = doubleTFValue * 1609340
            length.yard = doubleTFValue * 1760
            length.inch = doubleTFValue * 63360
            
            meterTF.text = "\(String(format: "%.\(decimalpoint)f",length.meter))"
            kmTF.text = "\(String(format: "%.\(decimalpoint)f",length.km))"
            cmTF.text = "\(String(format: "%.\(decimalpoint)f",length.cm))"
            mmTF.text = "\(String(format: "%.\(decimalpoint)f",length.mm))"
            yardTF.text = "\(String(format: "%.\(decimalpoint)f",length.yard))"
            inchTF.text = "\(String(format: "%.\(decimalpoint)f",length.inch))"
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func cmChnage(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            length.meter = doubleTFValue / 100
            length.km = doubleTFValue / 100000
            length.mile = doubleTFValue / 160934
            length.cm = doubleTFValue
            length.mm = doubleTFValue * 10
            length.yard = doubleTFValue / 91.44
            length.inch = doubleTFValue / 2.54
            
            meterTF.text = "\(String(format: "%.\(decimalpoint)f",length.meter))"
            kmTF.text = "\(String(format: "%.\(decimalpoint)f",length.km))"
            mileTF.text = "\(String(format: "%.\(decimalpoint)f",length.mile))"
            mmTF.text = "\(String(format: "%.\(decimalpoint)f",length.mm))"
            yardTF.text = "\(String(format: "%.\(decimalpoint)f",length.yard))"
            inchTF.text = "\(String(format: "%.\(decimalpoint)f",length.inch))"
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func mmChnage(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            length.meter = doubleTFValue / 1000
            length.km = doubleTFValue / 1000000
            length.mile = doubleTFValue / 1609340
            length.cm = doubleTFValue / 10
            length.mm = doubleTFValue
            length.yard = doubleTFValue / 914
            length.inch = doubleTFValue / 25.4
            
            meterTF.text = "\(String(format: "%.\(decimalpoint)f",length.meter))"
            kmTF.text = "\(String(format: "%.\(decimalpoint)f",length.km))"
            mileTF.text = "\(String(format: "%.\(decimalpoint)f",length.mile))"
            cmTF.text = "\(String(format: "%.\(decimalpoint)f",length.cm))"
            yardTF.text = "\(String(format: "%.\(decimalpoint)f",length.yard))"
            inchTF.text = "\(String(format: "%.\(decimalpoint)f",length.inch))"
            
        }else{
            resetFields()
        }
    }
    @IBAction func yardChnage(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            length.meter = doubleTFValue / 1.094
            length.km = doubleTFValue / 1094
            length.mile = doubleTFValue / 1760
            length.cm = doubleTFValue * 91.44
            length.mm = doubleTFValue * 914
            length.yard = doubleTFValue
            length.inch = doubleTFValue * 36
            
            meterTF.text = "\(String(format: "%.\(decimalpoint)f",length.meter))"
            kmTF.text = "\(String(format: "%.\(decimalpoint)f",length.km))"
            mileTF.text = "\(String(format: "%.\(decimalpoint)f",length.mile))"
            cmTF.text = "\(String(format: "%.\(decimalpoint)f",length.cm))"
            mmTF.text = "\(String(format: "%.\(decimalpoint)f",length.mm))"
            inchTF.text = "\(String(format: "%.\(decimalpoint)f",length.inch))"
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func inchChange(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            length.meter = doubleTFValue / 39.37
            length.km = doubleTFValue / 39370
            length.mile = doubleTFValue / 63360
            length.cm = doubleTFValue * 2.54
            length.mm = doubleTFValue * 25.4
            length.yard = doubleTFValue / 36
            length.inch = doubleTFValue
            
            meterTF.text = "\(String(format: "%.\(decimalpoint)f",length.meter))"
            kmTF.text = "\(String(format: "%.\(decimalpoint)f",length.km))"
            mileTF.text = "\(String(format: "%.\(decimalpoint)f",length.mile))"
            cmTF.text = "\(String(format: "%.\(decimalpoint)f",length.cm))"
            mmTF.text = "\(String(format: "%.\(decimalpoint)f",length.mm))"
            yardTF.text = "\(String(format: "%.\(decimalpoint)f",length.yard))"
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func onSave(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        let saveLength = "\(String(format: "%.\(decimalpoint)f",length.meter)) meter = \(String(format: "%.\(decimalpoint)f",length.km)) km = \(String(format: "%.\(decimalpoint)f",length.mile)) mile = \(String(format: "%.\(decimalpoint)f",length.cm)) cm = \(String(format: "%.\(decimalpoint)f",length.mm)) mm = \(String(format: "%.\(decimalpoint)f",length.yard)) yard = \(String(format: "%.\(decimalpoint)f",length.inch)) inch "
        var arr = defaults.array(forKey: "LengthHistory") as? [String] ?? []
        if arr.count >= 5 {
            arr = Array(arr.suffix(5 - 1))
        }
        arr.append(saveLength)
        defaults.set(arr, forKey: "LengthHistory")
        
    }
    
    @IBAction func resetTextFields(_ sender: UIButton) {
        resetFields()
    }
    
    func resetFields() -> () {
        meterTF.text = ""
        kmTF.text = ""
        mileTF.text = ""
        cmTF.text = ""
        mmTF.text = ""
        yardTF.text = ""
        inchTF.text = ""
        
    }
    
}

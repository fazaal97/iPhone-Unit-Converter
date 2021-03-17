//
//  SpeedViewController.swift
//  iPhone Unit Converter Application
//
//  Created by Fazal on 2021-03-14.
//


import UIKit


class SpeedViewController: UIViewController , UITextFieldDelegate{
    
    
    @IBOutlet weak var meterSecTF: UITextField!
    @IBOutlet weak var kmHourTF: UITextField!
    @IBOutlet weak var milesHourTF: UITextField!
    @IBOutlet weak var nauticalMilesHourTF: UITextField!
    @IBOutlet weak var customKeyboard: CustomKeyboard!
    
    let speed : Speed = Speed(meterSec: 0.0, kmHour: 0.0, milesHour: 0.0, nauticalMilesHour: 0.0)
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
        meterSecTF.delegate = self
        kmHourTF.delegate = self
        milesHourTF.delegate = self
        nauticalMilesHourTF.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        customKeyboard.activeTextField = textField
    }
    
    
    @IBAction func meterSecChnage(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            speed.meterSec = doubleTFValue
            speed.kmHour = doubleTFValue * 3.6
            speed.milesHour = doubleTFValue * 2.237
            speed.nauticalMilesHour = doubleTFValue * 1.944
            
            kmHourTF.text = "\(String(format: "%.\(decimalpoint)f",speed.kmHour))"
            milesHourTF.text = "\(String(format: "%.\(decimalpoint)f",speed.milesHour))"
            nauticalMilesHourTF.text = "\(String(format: "%.\(decimalpoint)f",speed.nauticalMilesHour))"
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func kmHourChnage(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            speed.meterSec = doubleTFValue / 3.6
            speed.kmHour = doubleTFValue
            speed.milesHour = doubleTFValue / 1.609
            speed.nauticalMilesHour = doubleTFValue * 1.852
            
            meterSecTF.text = "\(speed.meterSec)"
            milesHourTF.text = "\(String(format: "%.\(decimalpoint)f",speed.milesHour))"
            nauticalMilesHourTF.text = "\(String(format: "%.\(decimalpoint)f",speed.nauticalMilesHour))"
            
        }else{
            resetFields()
        }
    }
    @IBAction func milesHourChange(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            speed.meterSec = doubleTFValue / 2.237
            speed.kmHour = doubleTFValue * 1.609
            speed.milesHour = doubleTFValue
            speed.nauticalMilesHour = doubleTFValue * 1.151
            
            meterSecTF.text = "\(speed.meterSec)"
            kmHourTF.text = "\(String(format: "%.\(decimalpoint)f",speed.kmHour))"
            nauticalMilesHourTF.text = "\(String(format: "%.\(decimalpoint)f",speed.nauticalMilesHour))"
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func nauticalMilesHourChnage(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            speed.meterSec = doubleTFValue / 1.944
            speed.kmHour = doubleTFValue * 1.852
            speed.milesHour = doubleTFValue * 1.151
            speed.nauticalMilesHour = doubleTFValue
            
            meterSecTF.text = "\(speed.meterSec)"
            kmHourTF.text = "\(String(format: "%.\(decimalpoint)f",speed.kmHour))"
            milesHourTF.text = "\(String(format: "%.\(decimalpoint)f",speed.milesHour))"
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func onSave(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        let saveSpeed = "\(speed.meterSec) Meter per second = \(String(format: "%.\(decimalpoint)f",speed.kmHour)) Kilometer per second = \(String(format: "%.\(decimalpoint)f",speed.milesHour)) Miles per second = \(String(format: "%.\(decimalpoint)f",speed.nauticalMilesHour)) Knot"
        var arr = defaults.array(forKey: "SpeedHistory") as? [String] ?? []
        if arr.count >= 5 {
            arr = Array(arr.suffix(5 - 1))
        }
        arr.append(saveSpeed)
        defaults.set(arr, forKey: "SpeedHistory")
    }
    
    @IBAction func resetTF(_ sender: UIButton) {
        resetFields()
    }
    
    func resetFields() -> () {
        meterSecTF.text = ""
        kmHourTF.text = ""
        milesHourTF.text = ""
        nauticalMilesHourTF.text = ""
        
    }
    
}

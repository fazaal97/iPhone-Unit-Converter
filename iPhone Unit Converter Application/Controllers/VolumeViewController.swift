//
//  VolumeViewController.swift
//  iPhone Unit Converter Application
//
//  Created by Fazal on 2021-03-14.
//

import UIKit

class VolumeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var ukGallonTF: UITextField!
    @IBOutlet weak var litreTF: UITextField!
    @IBOutlet weak var ukPintTF: UITextField!
    @IBOutlet weak var fluidOunceTF: UITextField!
    @IBOutlet weak var millilitreTF: UITextField!
    @IBOutlet weak var customKeyboard: CustomKeyboard!
    
    let voulume: Volume = Volume(ukGallon: 0.0, litre: 0.0, ukPint: 0.0, fluidOunce: 0.0, millilitre: 0.0)
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
        ukGallonTF.delegate = self
        litreTF.delegate = self
        ukPintTF.delegate = self
        fluidOunceTF.delegate = self
        millilitreTF.delegate = self
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        customKeyboard.activeTextField = textField
    }
    
    @IBAction func ukGallonChange(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            voulume.ukGallon = doubleTFValue
            voulume.litre = doubleTFValue * 4.546
            voulume.ukPint = doubleTFValue * 8
            voulume.fluidOunce = doubleTFValue * 160
            voulume.millilitre = doubleTFValue * 4546
            
            litreTF.text = "\(String(format: "%.\(decimalpoint)f",voulume.litre))"
            ukPintTF.text = "\(String(format: "%.\(decimalpoint)f",voulume.ukPint))"
            fluidOunceTF.text = "\(String(format: "%.\(decimalpoint)f",voulume.fluidOunce))"
            millilitreTF.text = "\(String(format: "%.\(decimalpoint)f",voulume.millilitre))"
            
        }else{
            resetFields()
        }
    }
    @IBAction func litreChnage(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            voulume.ukGallon = doubleTFValue / 4.546
            voulume.litre = doubleTFValue
            voulume.ukPint = doubleTFValue * 1.76
            voulume.fluidOunce = doubleTFValue * 35.195
            voulume.millilitre = doubleTFValue * 1000
            
            ukGallonTF.text = "\(String(format: "%.\(decimalpoint)f",voulume.ukGallon))"
            ukPintTF.text = "\(String(format: "%.\(decimalpoint)f",voulume.ukPint))"
            fluidOunceTF.text = "\(String(format: "%.\(decimalpoint)f",voulume.fluidOunce))"
            millilitreTF.text = "\(String(format: "%.\(decimalpoint)f",voulume.millilitre))"
            
        }else{
            resetFields()
        }
    }
    @IBAction func ukPintChange(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            voulume.ukGallon = doubleTFValue / 8
            voulume.litre = doubleTFValue / 1.76
            voulume.ukPint = doubleTFValue
            voulume.fluidOunce = doubleTFValue * 20
            voulume.millilitre = doubleTFValue * 568
            
            ukGallonTF.text = "\(String(format: "%.\(decimalpoint)f",voulume.ukGallon))"
            litreTF.text = "\(String(format: "%.\(decimalpoint)f",voulume.litre))"
            fluidOunceTF.text = "\(String(format: "%.\(decimalpoint)f",voulume.fluidOunce))"
            millilitreTF.text = "\(String(format: "%.\(decimalpoint)f",voulume.millilitre))"
            
        }else{
            resetFields()
        }
    }
    @IBAction func fluidOunceChnage(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            voulume.ukGallon = doubleTFValue / 160
            voulume.litre = doubleTFValue / 35.195
            voulume.ukPint = doubleTFValue / 20
            voulume.fluidOunce = doubleTFValue
            voulume.millilitre = doubleTFValue * 28.413
            
            ukGallonTF.text = "\(String(format: "%.\(decimalpoint)f",voulume.ukGallon))"
            litreTF.text = "\(String(format: "%.\(decimalpoint)f",voulume.litre))"
            ukPintTF.text = "\(String(format: "%.\(decimalpoint)f",voulume.ukPint))"
            millilitreTF.text = "\(String(format: "%.\(decimalpoint)f",voulume.millilitre))"
            
        }else{
            resetFields()
        }
    }
    @IBAction func millilitreChange(_ sender: UITextField) {
        guard let tfValue = sender.text else { return }
        if (!tfValue.isEmpty) {
            guard let doubleTFValue = Double(tfValue) else { return }
            
            voulume.ukGallon = doubleTFValue / 4546
            voulume.litre = doubleTFValue / 1000
            voulume.ukPint = doubleTFValue / 568
            voulume.fluidOunce = doubleTFValue / 29.574
            voulume.millilitre = doubleTFValue
            
            ukGallonTF.text = "\(String(format: "%.\(decimalpoint)f",voulume.ukGallon))"
            litreTF.text = "\(String(format: "%.\(decimalpoint)f",voulume.litre))"
            ukPintTF.text = "\(String(format: "%.\(decimalpoint)f",voulume.ukPint))"
            fluidOunceTF.text = "\(String(format: "%.\(decimalpoint)f",voulume.fluidOunce))"
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func onSave(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        let saveVolume = "\(String(format: "%.\(decimalpoint)f",voulume.ukGallon)) UK Gallon = \(String(format: "%.\(decimalpoint)f",voulume.litre)) litre = \(String(format: "%.\(decimalpoint)f",voulume.ukPint)) UK pint = \(String(format: "%.\(decimalpoint)f",voulume.fluidOunce)) fluid ounce = \(String(format: "%.\(decimalpoint)f",voulume.millilitre)) millilire"
        
        var arr = defaults.array(forKey: "VolumeHistory") as? [String] ?? []
        
        if arr.count >= 5 {
            arr = Array(arr.suffix(5 - 1))
        }
        arr.append(saveVolume)
        defaults.set(arr, forKey: "VolumeHistory")
        let alert = UIAlertController(title: "Success", message: "The conversions saved successfully!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func reserTF(_ sender: UIButton) {
        resetFields()
    }
    
    func resetFields() -> () {
        ukGallonTF.text = ""
        litreTF.text = ""
        ukPintTF.text = ""
        fluidOunceTF.text = ""
        millilitreTF.text = ""
        
        
    }
    
    
}

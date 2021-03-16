//
//  History.swift
//  iPhone Unit Converter Application
//
//  Created by Fazal on 2021-03-15.
//

import UIKit
class History {
    
    let unitType: String
    let icon: UIImage
    let conversion: String
    
    init(unitType: String, icon: UIImage, conversion: String) {
        self.unitType = unitType
        self.icon = icon
        self.conversion = conversion
    }
    
    func getUnitType() -> String {
        return unitType
    }
    
    func getUnitIcon() -> UIImage {
        return icon
    }
    
    func getUnitConversion() -> String {
        return conversion
    }
    
}

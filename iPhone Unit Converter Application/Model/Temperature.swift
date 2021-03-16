//
//  Temperature.swift
//  iPhone Unit Converter Application
//
//  Created by Fazal on 2021-03-14.
//

import Foundation

class Temperature {
    var celsius : Double
    var farenheit : Double
    var kelvin : Double
    var savedTemperature : [String]
    
    init(celsius: Double, farenheit: Double, kelvin: Double) {
        self.celsius = celsius
        self.farenheit = farenheit
        self.kelvin = kelvin
        self.savedTemperature = [String]()
        
    }
    
}

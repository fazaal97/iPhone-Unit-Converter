//
//  Length.swift
//  iPhone Unit Converter Application
//
//  Created by Fazal on 2021-03-16.
//

import Foundation

class Length {
    
    var meter : Double
    var km : Double
    var mile : Double
    var cm : Double
    var mm : Double
    var yard : Double
    var inch : Double
    var savedLength : [String]
    
    init(meter: Double , km:Double, mile:Double , cm:Double , mm:Double , yard:Double , inch:Double) {
        self.meter = meter
        self.km = km
        self.mile = mile
        self.cm = cm
        self.mm = mm
        self.yard = yard
        self.inch = inch
        self.savedLength = [String]()
    }
    
    
}

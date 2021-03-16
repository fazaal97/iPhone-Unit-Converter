//
//  Speed.swift
//  iPhone Unit Converter Application
//
//  Created by Fazal on 2021-03-16.
//

import Foundation

class Speed {
    
    var meterSec : Double
    var kmHour : Double
    var milesHour : Double
    var nauticalMilesHour : Double
    var savedSpeed : [String]
    
    init(meterSec:Double, kmHour:Double , milesHour: Double, nauticalMilesHour:Double) {
        self.meterSec = meterSec
        self.kmHour = kmHour
        self.milesHour = milesHour
        self.nauticalMilesHour = nauticalMilesHour
        self.savedSpeed = [String]()
    }
    
}

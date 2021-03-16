//
//  Weight.swift
//  iPhone Unit Converter Application
//
//  Created by Fazal on 2021-03-13.
//

import Foundation

class Weight {
    
    var kg : Double
    var pound : Double
    var ounce : Double
    var gram : Double
    var stone : Double
    var stonePound : Double
    var savedWeights : [String]
    
    init(kg: Double, pound: Double, ounce: Double, gram: Double, stone:Double , stonePound : Double) {
        self.kg = kg
        self.pound = pound
        self.ounce = ounce
        self.gram = gram
        self.stone = stone
        self.stonePound = stonePound
        self.savedWeights = [String]()
        
    }
    
}

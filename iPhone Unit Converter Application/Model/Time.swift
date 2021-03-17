//
//  Time.swift
//  iPhone Unit Converter Application
//
//  Created by user187743 on 3/17/21.
//

import Foundation

class Time {
    
    var hour : Double
    var minute : Double
    var second : Double
    var day : Double
    var week : Double
    var month : Double
    
    init(hour:Double, minute:Double , second: Double, day:Double , week:Double , month:Double) {
        self.hour = hour
        self.minute = minute
        self.second = second
        self.day = day
        self.week = week
        self.month = month
    }
    
}

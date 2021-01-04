//
//  FormedWeatherObjectForDisplay.swift
//  SwiftUI-Weather
//
//  Created by Lee on 2/1/21.
//

import Foundation

struct FormedWeatherObjectForDisplay {
    var temp: Double = 0.0
    var dayString: String
    var weatherDescriptor: String = ""
    var arrayOfWeatherDescriptors: [String] = []
    
    var arrayOfTemps: [Double] = [] {
        didSet {
            /// sets the temp to be the average of the array of temperatures
            self.temp = arrayOfTemps.reduce(0, +)/Double(arrayOfTemps.count)
        }
    }
    
    /// set the temp value to 1 dec place
    mutating func roundTempValue() {
        temp = temp.rounded(toPlaces: 0)
    }
    
    func allocateWeatherDescriptor() {
        print("lol")
    }
    
    
    init(dayString: String) {
        self.dayString = dayString
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

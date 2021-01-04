//
//  DataHandler.swift
//  SwiftUI-Weather
//
//  Created by Lee on 2/1/21.
//

import Foundation

struct DataHandler {
    
    func makeSenseOfData(from data: WeatherObject) -> [FormedWeatherObjectForDisplay]{
        
        var itemsToBeDisplayed: [FormedWeatherObjectForDisplay] = []
        
        for entry in data.list {
            var dateString = entry.dt_txt
            dateString.removeLast(9)
            
            print(entry)
            
            if let index = itemsToBeDisplayed.firstIndex(where: { ($0.dayString == dateString) }) {
                itemsToBeDisplayed[index].arrayOfTemps.append(entry.main.temp)
            } else {
                var newDayObject = FormedWeatherObjectForDisplay(dayString: dateString)
                newDayObject.arrayOfTemps.append(entry.main.temp)
                itemsToBeDisplayed.append(FormedWeatherObjectForDisplay(dayString: dateString))
            }
        }
        
        for i in 0..<itemsToBeDisplayed.count {
            itemsToBeDisplayed[i].roundTempValue()
        }
        
        for object in itemsToBeDisplayed {
            print(object.dayString)
        }
        
        return itemsToBeDisplayed
    }
}

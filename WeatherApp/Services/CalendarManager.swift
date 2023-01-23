//
//  CalendarManager.swift
//  WeatherApp
//
//  Created by Данила Братинов on 23.01.2023.
//

import Foundation

class CalendarManager {
    static let shared = CalendarManager()
    
    private init() {}
 
    func getWeekday() -> String {
        let date = Date()
        let calendar = Calendar.current
        
        let currentDay = calendar.component(.weekday, from: date)
        
        var day: String
        
        switch currentDay {
        case 1:
            day = "Воскресенье"
        case 2:
            day = "Понедельник"
        case 3:
            day = "Вторник"
        case 4:
            day = "Среда"
        case 5:
            day = "Четверг"
        case 6:
            day = "Пятница"
        case 7:
            day = "Суббота"
        default:
            day = "Неизвестно"
        }
        
        return day
    }
}

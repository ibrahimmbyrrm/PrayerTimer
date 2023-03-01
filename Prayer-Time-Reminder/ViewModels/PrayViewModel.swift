//
//  PrayViewModel.swift
//  Prayer-Time-Reminder
//
//  Created by İbrahim Bayram on 1.03.2023.
//

import Foundation

struct PrayTimeViewModel {
    var city : PrayCity
    
    var name : String {
        return city.city
    }
    var sabah : String {
        return city.today.sabah
    }
    var oglen : String {
        return city.today.oglen
    }
    
}

//
//  PrayTimes.swift
//  Prayer-Time-Reminder
//
//  Created by İbrahim Bayram on 1.03.2023.
//

import Foundation

struct PrayCity : Codable {
    let city : String
    let date : String
    let today : Today
    let tomorrow : Today
    
}
struct Today: Codable {
    let sabah, dogum, oglen, ikindi: String
    let aksam, yatsi: String

    enum CodingKeys: String, CodingKey {
        case sabah = "Fajr"
        case dogum = "Sunrise"
        case oglen = "Dhuhr"
        case ikindi = "Asr"
        case aksam = "Maghrib"
        case yatsi = "Isha'a"
    }
}



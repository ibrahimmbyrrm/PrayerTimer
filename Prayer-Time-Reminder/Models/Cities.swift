//
//  Cities.swift
//  Prayer-Time-Reminder
//
//  Created by İbrahim Bayram on 1.03.2023.
//

import Foundation

struct InitialData : Codable {
    let status : String
    let data : [Province]
}

struct Province : Codable {
    let id : Int
    let name : String
}

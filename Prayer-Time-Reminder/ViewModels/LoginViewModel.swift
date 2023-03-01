//
//  LoginViewModel.swift
//  Prayer-Time-Reminder
//
//  Created by İbrahim Bayram on 1.03.2023.
//

import Foundation

struct CityListViewModel {
    let cities : [Province]
    
    func numberOfComponents() -> Int {
        return cities.count
    }
    func titleForComponents(index : Int) -> String {
        return cities[index].name
    }
    func provinceForRow(_ index : Int) -> CityViewModel {
        let city = cities[index]
        return CityViewModel(city: city)
    }
    func saveCity(city : String) {
        UserDefaults.standard.set(city, forKey: "selected")
    }
}
struct CityViewModel {
    let city : Province
    
    var name : String {
        return city.name
    }
}

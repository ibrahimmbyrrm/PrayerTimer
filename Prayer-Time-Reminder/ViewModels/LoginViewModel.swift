//
//  LoginViewModel.swift
//  Prayer-Time-Reminder
//
//  Created by İbrahim Bayram on 1.03.2023.
//

import Foundation
import UIKit

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
    func prepareSegue(for segue : UIStoryboardSegue, selection : String) {
        if segue.identifier == "toDetail" {
            let destVC = segue.destination as! DetailView
            destVC.prayService = PrayTimeService(city: selection)
            print(selection)
        }
    }
}
struct CityViewModel {
    let city : Province
    
    var name : String {
        return city.name
    }
    
    
}

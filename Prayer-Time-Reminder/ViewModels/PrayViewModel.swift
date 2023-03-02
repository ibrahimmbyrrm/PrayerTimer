//
//  PrayViewModel.swift
//  Prayer-Time-Reminder
//
//  Created by İbrahim Bayram on 1.03.2023.
//

import Foundation
import UIKit

struct PrayTimeViewModel {
    var city : PrayCity

    func updateTodayLabels(name : UILabel,sabah : UILabel, oglen : UILabel, ikindi : UILabel, aksam : UILabel, yatsi : UILabel) {
        sabah.text = city.today.sabah
        oglen.text = city.today.oglen
        ikindi.text = city.today.ikindi
        aksam.text = city.today.aksam
        yatsi.text = city.today.yatsi
        name.text = city.city
        
    }
    func updateTomorrowLabels(sabah : UILabel, oglen : UILabel, ikindi : UILabel, aksam : UILabel, yatsi : UILabel) {
        sabah.text = city.tomorrow.sabah
        oglen.text = city.tomorrow.oglen
        ikindi.text = city.tomorrow.ikindi
        aksam.text = city.tomorrow.aksam
        yatsi.text = city.tomorrow.yatsi
    }
   
    
}

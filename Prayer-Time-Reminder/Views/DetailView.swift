//
//  DetailView.swift
//  Prayer-Time-Reminder
//
//  Created by İbrahim Bayram on 1.03.2023.
//

import UIKit

class DetailView: UIViewController {
    var prayService : PrayTimeService?
    var prayViewModel : PrayTimeViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        prayService?.callAPI(completion: { result in
            switch result {
            case .success(let city):
                DispatchQueue.main.async {
                    self.prayViewModel = PrayTimeViewModel(city: city)
                    print(self.prayViewModel.oglen)
                    print(city.date)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
      
        
       
    }
  
}

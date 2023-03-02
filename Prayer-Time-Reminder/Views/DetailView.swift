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
    var userdef = UserDefaults.standard.value(forKey: "selected") as? String
    var timer = Timer()
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var todayMorning: UILabel!
    @IBOutlet weak var tomorrowMorning: UILabel!
    @IBOutlet weak var todayEvening: UILabel!
    @IBOutlet weak var tomorrowEvening: UILabel!
    @IBOutlet weak var todayIkindi: UILabel!
    @IBOutlet weak var tomorrowIkindi: UILabel!
    @IBOutlet weak var todayAksam: UILabel!
    @IBOutlet weak var tomorrowAksam: UILabel!
    @IBOutlet weak var todayYatsi: UILabel!
    @IBOutlet weak var tomorrowYatsi: UILabel!
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentTime()
        if userdef != nil {
            prayService = PrayTimeService(city: userdef!)
        }
        prayService?.callAPI(completion: { result in
            switch result {
            case .success(let city):
                DispatchQueue.main.async {
                    self.prayViewModel = PrayTimeViewModel(city: city)
                    self.prayViewModel.updateTodayLabels(name : self.cityNameLabel,sabah: self.todayMorning, oglen: self.todayEvening, ikindi: self.todayIkindi, aksam: self.todayAksam, yatsi: self.todayYatsi)
                    self.prayViewModel.updateTomorrowLabels(sabah: self.tomorrowMorning, oglen: self.tomorrowEvening, ikindi: self.tomorrowIkindi, aksam: self.tomorrowAksam, yatsi: self.tomorrowYatsi)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    @IBAction func changeTheCity(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "selected")
        performSegue(withIdentifier: "toLogin", sender: nil)
    }
    
    
    private func getCurrentTime() {
           timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.currentTime) , userInfo: nil, repeats: true)
       }

       @objc func currentTime() {
           let formatter = DateFormatter()
           formatter.dateFormat = "hh:mm"
           currentTimeLabel.text = formatter.string(from: Date())
       }
  
}

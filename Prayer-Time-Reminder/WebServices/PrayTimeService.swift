//
//  PrayTimeService.swift
//  Prayer-Time-Reminder
//
//  Created by İbrahim Bayram on 1.03.2023.
//

import Foundation

struct PrayTimeService {
    var city = UserDefaults.standard.value(forKey: "selected") as? String
    
    func callAPI(completion : @escaping(Result<PrayCity, Error>)-> Void) {
        guard let requestURL = URL(string: "https://dailyprayer.abdulrcs.repl.co/api/\(city!)") else {return}
        URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            guard let data = data, error == nil else {
                print("error is here")
                return
                
            }
            let jsonData = try? JSONDecoder().decode(PrayCity.self, from: data)
            guard let jsonData = jsonData else {
                completion(.failure(error!))
                return
            }
            completion(.success(jsonData))
        }.resume()
    }
}

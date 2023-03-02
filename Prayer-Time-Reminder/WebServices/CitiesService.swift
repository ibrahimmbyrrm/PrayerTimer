//
//  CitiesService.swift
//  Prayer-Time-Reminder
//
//  Created by İbrahim Bayram on 1.03.2023.
//c

import Foundation

struct CityService {
    var urlString = "https://turkiyeapi.cyclic.app/api/v1/provinces"
    
    func callAPI(completion : @escaping(Result<[Province] , Error>) -> Void) {
        guard let requestURL = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            guard let data = data else {return}
            guard error == nil else {return}
                
            let jsonData = try? JSONDecoder().decode(InitialData.self, from: data)
                guard let jsonData = jsonData else {return}
                let result = jsonData.data
            print(result[2].name)
                completion(.success(result))
           
        }.resume()
    }
    
}

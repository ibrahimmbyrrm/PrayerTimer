//
//  ViewController.swift
//  Prayer-Time-Reminder
//
//  Created by İbrahim Bayram on 1.03.2023.
//

import UIKit

class LoginView: UIViewController {
    var viewModel : CityListViewModel? = nil {
        didSet{
            DispatchQueue.main.async {
                self.cityPicker.reloadAllComponents()
            }
        }
    }
    var selectedCity : String?
    var service = CityService()
    @IBOutlet weak var cityPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cityPicker.delegate = self
        cityPicker.dataSource = self
        fetchData()
        
    }
    
    func fetchData() {
        service.callAPI { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let cities):
                DispatchQueue.main.async {
                    self.viewModel = CityListViewModel(cities: cities)
                }
            }
        }
    }
    
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        if let selected = selectedCity {
            viewModel?.saveCity(city: selected)
            performSegue(withIdentifier: "toDetail", sender: nil)
        }else {
            print("you should select a city.")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let destVC = segue.destination as! DetailView
            destVC.prayService = PrayTimeService(city: selectedCity!)
        }
    }
    

}
extension LoginView : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel?.numberOfComponents() ?? 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel?.titleForComponents(index: row)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selection = viewModel?.provinceForRow(row).name.lowercased()
        self.selectedCity = selection
    }
        
}



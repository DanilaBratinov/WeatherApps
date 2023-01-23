//
//  DetailsViewController.swift
//  WeatherApp
//
//  Created by Данила Братинов on 22.01.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var city: Cities!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var minTempLabel: UILabel!
    @IBOutlet var maxTempLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getForecast()
    }
    
    private func setupView() {
        nameLabel.text = city.name
        tempLabel.text = city.temperature.formatted()
        minTempLabel.text = city.tempMin.formatted()
        maxTempLabel.text = city.tempMax.formatted()
    }
    
    private func getForecast() {        
        let url =  "https://api.weather.yandex.ru/v2/forecast?lat=\(city.lat)&lon=\(city.lon)&extra=true"
        NetworkManager.shared.getRequest(type: Forecast.self, from: url) { [weak self] result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}

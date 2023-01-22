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
        getForcast()
    }
    
    private func setupView() {
        nameLabel.text = city.name
        tempLabel.text = city.temperature.formatted()
        minTempLabel.text = city.tempMin.formatted()
        maxTempLabel.text = city.tempMax.formatted()
    }
    
    private func getForcast() {
        let url = "http://api.openweathermap.org/data/2.5/forecast?lat=35.7021&lon=139.7753&appid=28ede8c4626bcba101f47c928f53f1b9&units=metric28ede8c4626bcba101f47c928f53f1b9&units=metric"
        NetworkManager.shared.fetch(Forcast.self, from: url) { [weak self] result in
            switch result {
            case .success(let forcast):
                print(forcast.list.first?.dtTxt ?? "nil")
            case .failure(let error):
                print(error)
            }
        }
    }
}

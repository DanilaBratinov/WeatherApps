//
//  ViewController.swift
//  WeatherApp
//
//  Created by Данила Братинов on 20.01.2023.
//

import UIKit
import CoreLocation

final class MainViewController: UIViewController {
    private let locationManager = CLLocationManager()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        startLocationManager()
    }
    
    private func updateWeather(latitude: Double, longtitude: Double) {
        guard URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude.description)&lon=\(longtitude.description)&lang=ru&appid=28ede8c4626bcba101f47c928f53f1b9&units=metric") != nil else { return }
                
        NetworkManager.shared.fetch(Weather.self, from: Links.weather.rawValue) { [weak self] result in
            switch result {
            case .success(let data):
                print(data.weather.first?.description ?? "Ошибка")
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension MainViewController: CLLocationManagerDelegate {
    private func startLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager.delegate = self
                self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
                self.locationManager.pausesLocationUpdatesAutomatically = false
                self.locationManager.startUpdatingLocation()
            }
        }
    }
    
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            updateWeather(latitude: lastLocation.coordinate.latitude, longtitude: lastLocation.coordinate.longitude)
            print(lastLocation.coordinate.latitude, lastLocation.coordinate.longitude)
        }
    }
}

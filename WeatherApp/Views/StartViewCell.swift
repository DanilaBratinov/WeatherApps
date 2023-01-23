//
//  StartViewCell.swift
//  WeatherApp
//
//  Created by Данила Братинов on 21.01.2023.
//

import UIKit

final class StartViewCell: UICollectionViewCell {
    
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    func configure(with city: Cities) {
        cityLabel.text = city.name
        temperatureLabel.text = "\(Int(city.temperature))°"
        descriptionLabel.text = city.description
        weatherImage.alpha = 0.9
        
        ImageManager.shared.setImage(with: descriptionLabel.text, imageView: weatherImage)
    }
}

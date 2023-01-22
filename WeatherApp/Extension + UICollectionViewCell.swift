//
//  Extension + UICollectionViewCell.swift
//  WeatherApp
//
//  Created by Данила Братинов on 22.01.2023.
//

import UIKit

extension UIView {
    func pulsate() {
        let springAnimtation = CASpringAnimation(keyPath: "transfrom.scale")
        springAnimtation.fromValue = 0.5
        springAnimtation.toValue = 1
        springAnimtation.duration = 1
        layer.add(springAnimtation, forKey: nil)
    }
}

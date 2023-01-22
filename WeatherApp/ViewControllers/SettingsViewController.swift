//
//  SettingsViewController.swift
//  WeatherApp
//
//  Created by Данила Братинов on 21.01.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var changeLanguage: UISegmentedControl!
    
    @IBAction func languageSC(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            updateLanguage("ru")
        default:
            updateLanguage("en")
        }
    }
}

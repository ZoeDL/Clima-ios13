//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchBar: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }


    @IBAction func searchButtonPressed(_ sender: UIButton) {
        searchBar.endEditing(true)
    }
    // hide keyboard when enter key is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Please enter a city name"
            return false
        }
    }
    
    // clear the user input
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = ""
        textField.placeholder = "Search"
    }
}


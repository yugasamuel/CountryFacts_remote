//
//  ViewController.swift
//  CountryFacts
//
//  Created by Yuga Samuel on 20/09/23.
//

import UIKit

class ViewController: UITableViewController {
    var countries: [String: Country] = Bundle.main.decode("countries.json")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


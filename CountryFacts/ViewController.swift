//
//  ViewController.swift
//  CountryFacts
//
//  Created by Yuga Samuel on 20/09/23.
//

import UIKit

class ViewController: UITableViewController {
    var countriesDict: [String: Country] = Bundle.main.decode("countries.json")
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCountries()
    }
    
    func loadCountries() {
        for key in countriesDict.keys.sorted() {
            countries.append(countriesDict[key]!)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = countries[indexPath.row].name
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Facts") as? FactsViewController {
            vc.country = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}


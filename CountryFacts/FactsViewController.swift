//
//  FactsViewController.swift
//  CountryFacts
//
//  Created by Yuga Samuel on 20/09/23.
//

import UIKit

class FactsViewController: UITableViewController {
    var facts: Facts!
    var factsDict: [String: String] = [:]
    var orderedKeys: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFacts()
    }
    
    func loadFacts() {
        orderedKeys = ["capital", "size", "population", "currency"]
        
        for key in orderedKeys {
            switch key {
            case "capital":
                factsDict[key] = facts.capital
            case "size":
                factsDict[key] = String(facts.size)
            case "population":
                factsDict[key] = String(facts.population)
            case "currency":
                factsDict[key] = facts.currency
            default:
                break
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderedKeys.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Fact", for: indexPath)
        
        let key = orderedKeys[indexPath.row]
        let value = factsDict[key]
        
        var content = cell.defaultContentConfiguration()
        content.text = key.capitalized
        content.secondaryText = value
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            let key = orderedKeys[indexPath.row]
            let value = factsDict[key]
            
            vc.key = key.capitalized
            vc.value = value
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

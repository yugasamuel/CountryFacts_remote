//
//  DetailViewController.swift
//  CountryFacts
//
//  Created by Yuga Samuel on 20/09/23.
//

import UIKit

class DetailViewController: UIViewController {
    var country: Country!
    var key: String!
    var value: String!
    var keyLabel: UILabel!
    var valueLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareFact))
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        keyLabel = UILabel()
        keyLabel.text = key
        keyLabel.font = UIFont.systemFont(ofSize: 32)
        keyLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(keyLabel)
        
        valueLabel = UILabel()
        valueLabel.text = value
        valueLabel.font = UIFont.systemFont(ofSize: 16)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            keyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            keyLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            valueLabel.topAnchor.constraint(equalTo: keyLabel.bottomAnchor, constant: 8),
            valueLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
    @objc func shareFact() {
        var message = "Did you know that \(country.name)"
        
        switch key {
        case "Capital":
            message += "'s capital is \(value!)"
        case "Size":
            message += " has the size of \(value!) square kilometers"
        case "Population":
            message += " has the population of \(value!)"
        case "Currency":
            message += "'s currency is \(value!)"
        default:
            break
        }
        
        let vc = UIActivityViewController(activityItems: [message], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}

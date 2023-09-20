//
//  DetailViewController.swift
//  CountryFacts
//
//  Created by Yuga Samuel on 20/09/23.
//

import UIKit

class DetailViewController: UIViewController {
    var key: String!
    var value: String!
    var keyLabel: UILabel!
    var valueLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
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
}

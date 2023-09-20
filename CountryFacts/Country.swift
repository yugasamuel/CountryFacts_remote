//
//  Country.swift
//  CountryFacts
//
//  Created by Yuga Samuel on 20/09/23.
//

import Foundation

class Country: Codable {
    let id: String
    let name: String
    let facts: Facts
}

class Facts: Codable {
    let capital: String
    let size: Double
    let population: Int
    let currency: String
}

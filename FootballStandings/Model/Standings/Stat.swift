//
//  Stat.swift
//  FootballStandings
//
//  Created by Артем Полушин on 07.07.2022.
//

struct Stat: Decodable {
    let name: String
    let displayName: String
    let shortDisplayName: String
    let description: String
    let abbreviation: String
    let type: String
    let value: Int?
    let displayValue: String
}

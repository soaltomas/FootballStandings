//
//  Seasons.swift
//  FootballStandings
//
//  Created by Артем Полушин on 06.07.2022.
//

struct Seasons: Decodable {
    let name: String?
    let description: String?
    let abbreviation: String?
    let seasons: [Season]
    
    enum CodingKeys: String, CodingKey {
        case name
        case description = "desc"
        case abbreviation
        case seasons
    }
}

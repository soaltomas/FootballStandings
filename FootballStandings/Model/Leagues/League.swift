//
//  League.swift
//  FootballStandings
//
//  Created by Артем Полушин on 06.07.2022.
//

struct League: Decodable {
    let id: String
    let name: String
    let slug: String
    let abbreviation: String
    let logos: Logos
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case slug
        case abbreviation = "abbr"
        case logos
    }
}

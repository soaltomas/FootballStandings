//
//  StandingLogo.swift
//  FootballStandings
//
//  Created by Артем Полушин on 07.07.2022.
//

struct StandingLogo: Decodable {
    let link: String
    let width: Int
    let height: Int
    let lastUpdated: String
    
    enum CodingKeys: String, CodingKey {
        case link = "href"
        case width
        case height
        case lastUpdated
    }
}

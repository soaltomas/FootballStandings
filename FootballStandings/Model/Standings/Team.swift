//
//  Team.swift
//  FootballStandings
//
//  Created by Артем Полушин on 07.07.2022.
//

struct Team: Decodable {
    let id: String
    let uid: String
    let location: String
    let name: String
    let abbreviation: String
    let displayName: String
    let shortDisplayName: String
    let isActive: Bool
    let logos: [StandingLogo]
    
}

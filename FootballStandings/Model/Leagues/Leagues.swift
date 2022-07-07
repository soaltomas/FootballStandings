//
//  LeaguesResponse.swift
//  FootballStandings
//
//  Created by Артем Полушин on 06.07.2022.
//

struct Leagues: Decodable {
    let status: Bool
    let data: [League]
}

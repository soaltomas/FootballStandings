//
//  StandingResponse.swift
//  FootballStandings
//
//  Created by Артем Полушин on 07.07.2022.
//

struct StandingsResponse: Decodable {
    let status: Bool
    let data: Standings
}

//
//  SeasonType.swift
//  FootballStandings
//
//  Created by Артем Полушин on 06.07.2022.
//

struct SeasonType: Decodable {
    let id: String
    let name: String
    let abbreviation: String
    let startDate: String
    let endDate: String
    let hasStandings: Bool
}

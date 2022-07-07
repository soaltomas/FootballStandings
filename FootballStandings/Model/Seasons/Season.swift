//
//  Season.swift
//  FootballStandings
//
//  Created by Артем Полушин on 06.07.2022.
//

struct Season: Decodable {
    let year: Int
    let startDate: String
    let endDate: String
    let displayName: String
    let types: [SeasonType]
}

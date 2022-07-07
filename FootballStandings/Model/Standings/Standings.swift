//
//  Standings.swift
//  FootballStandings
//
//  Created by Артем Полушин on 07.07.2022.
//

struct Standings: Decodable {
    let name: String
    let seasonDisplay: String
    let season: Int
    let standings: [Standing]
}

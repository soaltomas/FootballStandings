//
//  Standing.swift
//  FootballStandings
//
//  Created by Артем Полушин on 07.07.2022.
//

struct Standing: Decodable {
    let team: Team
    let note: Note?
    let stats: [Stat]
}

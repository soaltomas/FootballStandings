//
//  StatViewModel.swift
//  FootballStandings
//
//  Created by Артем Полушин on 07.07.2022.
//

struct StatViewModel {
    let name: String
    let description: String
    let goals: String
    
    init(stat: Stat) {
        name = stat.displayName
        description = stat.description
        goals = stat.displayValue
    }
}

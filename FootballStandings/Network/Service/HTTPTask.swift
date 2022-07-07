//
//  HTTPTask.swift
//  FootballStandings
//
//  Created by Артем Полушин on 06.07.2022.
//

// Определяет тип конкретного запроса (с параметрами/без параметров)
enum HTTPTask {
    case request
    case requestWithParameters(parameters: Parameters)
}

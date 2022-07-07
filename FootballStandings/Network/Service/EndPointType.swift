//
//  EndPointType.swift
//  FootballStandings
//
//  Created by Артем Полушин on 06.07.2022.
//

import Foundation

// Протокол, описывающий конфигурацию сетевого запроса
protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: HTTPTask { get }
}

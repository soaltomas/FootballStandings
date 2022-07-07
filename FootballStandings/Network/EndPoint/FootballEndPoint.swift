//
//  FootballEndPoint.swift
//  FootballStandings
//
//  Created by Артем Полушин on 06.07.2022.
//

import Foundation

private extension FootballEndPoint {
    struct Constants {
        static let baseURL = "https://api-football-standings.azharimm.site/leagues/"
    }
}

// Реализация(сборка) эндпойнта (основной url + конечный эндпойнт + параметры)
enum FootballEndPoint {
    case allLeagues
    case seasons(id: String)
    case standings(id: String, season: String)
}

extension FootballEndPoint: EndPointType {
    var baseURL: URL {
        guard let url = URL(string: Constants.baseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .allLeagues:
            return ""
        case let .seasons(id):
            return "\(id)/seasons"
        case let .standings(id, _):
            return "\(id)/standings"
        }
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var task: HTTPTask {
        switch self {
        case let .standings(_, season):
            return .requestWithParameters(parameters: ["season": season, "sort": "asc"])
        default:
            return .request
        }
    }
}

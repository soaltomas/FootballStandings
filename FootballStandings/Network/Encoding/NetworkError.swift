//
//  NetworkError.swift
//  FootballStandings
//
//  Created by Артем Полушин on 06.07.2022.
//

enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil"
    case encodingFailed = "Parameter encoding failed"
    case missingURL = "URL is nil"
}

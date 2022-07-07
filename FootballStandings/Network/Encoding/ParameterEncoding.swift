//
//  ParameterEncoding.swift
//  FootballStandings
//
//  Created by Артем Полушин on 06.07.2022.
//

import Foundation

typealias Parameters = [String: Any]

// Протокол, используемый для кодирования параметров запроса
protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

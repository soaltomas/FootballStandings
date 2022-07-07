//
//  NetworkResponse.swift
//  FootballStandings
//
//  Created by Артем Полушин on 06.07.2022.
//

enum NetworkResponse: String {
    case success
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated"
    case failed = "Network request failed"
    case noData = "Response returned with no data to decode"
    case unableToDecode = "We could not decode the response"
}

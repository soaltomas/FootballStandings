//
//  NetworkRouter.swift
//  FootballStandings
//
//  Created by Артем Полушин on 06.07.2022.
//

import Foundation

typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()

// Протокол для отправки сетевых запросов
protocol NetworkRouter: AnyObject {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}

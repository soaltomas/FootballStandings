//
//  Result.swift
//  FootballStandings
//
//  Created by Артем Полушин on 06.07.2022.
//

// Статус ответа на сетевой запрос
// - success: всё хорошо
// - failure: ошибка + описание ошибки
enum Result<String> {
    case success
    case failure(String)
}

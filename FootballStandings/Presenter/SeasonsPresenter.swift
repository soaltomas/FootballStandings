//
//  SeasonsPresenter.swift
//  FootballStandings
//
//  Created by Артем Полушин on 06.07.2022.
//

import Foundation

protocol SeasonsPresenterInput: AnyObject {
    func loadData(for league: League)
}

final class SeasonsPresenter: SeasonsPresenterInput {
    weak var view: SeasonsView?
    private let model = ModelFacade()
    
    init(view: SeasonsView) {
        self.view = view
    }
    
    func loadData(for league: League) {
        model.getSeasons(for: league.id) { [weak self] seasons in
            DispatchQueue.main.async {
                self?.view?.displaySeasons(seasons: seasons)
            }
        }
    }
}

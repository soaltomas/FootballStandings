//
//  AllLeaguesPresenter.swift
//  FootballStandings
//
//  Created by Артем Полушин on 06.07.2022.
//

import Foundation

protocol AllLeaguesPresenterInput: AnyObject {
    func loadData()
}

final class AllLeaguesPresenter: AllLeaguesPresenterInput {
    weak var view: AllLeaguesView?
    private let model = ModelFacade()
    
    init(view: AllLeaguesView) {
        self.view = view
    }
    
    func loadData() {
        model.getAllLeague { [weak self] leagues in
            DispatchQueue.main.async {
                self?.view?.displayAllLeague(leagues: leagues)
            }
        }
    }
}

//
//  StandingsViewController.swift
//  FootballStandings
//
//  Created by Артем Полушин on 07.07.2022.
//

import Foundation

protocol StandingsPresenterInput: AnyObject {
    func loadData(for league: League, season: String)
}

final class StandingsPresenter: StandingsPresenterInput {
    weak var view: StandingsView?
    private let model = ModelFacade()
    
    init(view: StandingsView) {
        self.view = view
    }
    
    func loadData(for league: League, season: String) {
        model.getStandings(for: league.id, season: season) { [weak self] standings in
            DispatchQueue.main.async {
                self?.view?.displayStandings(standings: standings)
            }
        }
    }
}

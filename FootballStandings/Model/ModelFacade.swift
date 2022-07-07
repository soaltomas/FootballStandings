//
//  ModelFacade.swift
//  FootballStandings
//
//  Created by Артем Полушин on 06.07.2022.
//

// В большом проекте стоило бы разделить на несколько. Здесь же нецелесообразно.
final class ModelFacade {
    private let networkManager = NetworkManager()
    
    func getAllLeague(completion: @escaping (_ leagues: [League]) -> Void) {
        networkManager.fetchLeagues() { leagues, error in
            guard let leagues = leagues else {
                if let error = error {
                    print(error)
                }
                return
            }
            completion(leagues.data)
        }
    }
    
    func getSeasons(for leagueId: String, completion: @escaping (_ seasons: [Season]) -> Void) {
        networkManager.fetchSeasons(for: leagueId) { seasons, error in
            guard let seasons = seasons else {
                if let error = error {
                    print(error)
                }
                return
            }
            completion(seasons.data.seasons)
        }
    }
    
    func getStandings(for leagueId: String, season: String, completion: @escaping (_ standings: [Standing]) -> Void) {
        networkManager.fetchStandings(for: leagueId, season: season) { standings, error in
            guard let standings = standings else {
                if let error = error {
                    print(error)
                }
                return
            }
            completion(standings.data.standings)
        }
    }
}

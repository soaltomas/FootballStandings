//
//  SeasonsViewController.swift
//  FootballStandings
//
//  Created by Артем Полушин on 06.07.2022.
//

import UIKit

private extension SeasonsViewController {
    struct Constants {
        static let cellIdentifier = "SeasonCell"
        static let title = "Seasons"
        static let rowHeight: CGFloat = 100
    }
}

protocol SeasonsView: AnyObject {
    func displaySeasons(seasons: [Season])
}

class SeasonsViewController: UIViewController {
    
    var presenter: SeasonsPresenterInput?
    var league: League?
    
    private var seasons: [Season] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(SeasonCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = Constants.title
        addSubviews()
        makeConstraints()
        tableView.rowHeight = Constants.rowHeight
        
        guard let league = league else {
            return
        }
        presenter?.loadData(for: league)
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
}

extension SeasonsViewController: SeasonsView {
    func displaySeasons(seasons: [Season]) {
        self.seasons = seasons
        tableView.reloadData()
    }
}

extension SeasonsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.isHidden = seasons.isEmpty
        return seasons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? SeasonCell
        cell?.configure(model: seasons[indexPath.row])
        return cell ?? UITableViewCell()
    }
}

extension SeasonsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = StandingsViewController()
        let presenter = StandingsPresenter(view: viewController)
        viewController.presenter = presenter
        viewController.league = league
        viewController.season = String(seasons[indexPath.row].year)
        viewController.seasons = seasons
        navigationController?.pushViewController(viewController, animated: true)
    }
}

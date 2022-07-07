//
//  AllLeaguesViewController.swift
//  FootballStandings
//
//  Created by Артем Полушин on 06.07.2022.
//

import UIKit

private extension AllLeaguesViewController {
    struct Constants {
        static let cellIdentifier = "LeagueCell"
        static let title = "Leagues"
        static let rowHeight: CGFloat = 100
    }
}

protocol AllLeaguesView: AnyObject {
    func displayAllLeague(leagues: [League])
}

class AllLeaguesViewController: UIViewController {
    
    var presenter: AllLeaguesPresenterInput?
    
    private var leagues: [League] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(LeagueCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
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
        presenter?.loadData()
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

extension AllLeaguesViewController: AllLeaguesView {
    func displayAllLeague(leagues: [League]) {
        self.leagues = leagues
        tableView.reloadData()
    }
}

extension AllLeaguesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.isHidden = leagues.isEmpty
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? LeagueCell
        cell?.configure(model: leagues[indexPath.row])
        return cell ?? UITableViewCell()
    }
}

extension AllLeaguesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = SeasonsViewController()
        let presenter = SeasonsPresenter(view: viewController)
        viewController.presenter = presenter
        viewController.league = leagues[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
}

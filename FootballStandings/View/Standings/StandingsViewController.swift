//
//  StandingsViewController.swift
//  FootballStandings
//
//  Created by Артем Полушин on 07.07.2022.
//

import UIKit

private extension StandingsViewController {
    struct Constants {
        static let cellIdentifier = "StandingCell"
        static let title = "Standings"
        static let rowHeight: CGFloat = 250
        static let chooseSeasonsTitle = "Seasons"
        static let seasonChooseDoneTitle = "Done"
    }
}

protocol StandingsView: AnyObject {
    func displayStandings(standings: [Standing])
}

class StandingsViewController: UIViewController {
    
    var presenter: StandingsPresenterInput?
    var league: League?
    var season: String = ""
    var seasons: [Season] = []
    
    private var standings: [Standing] = []
    
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(StandingCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
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
        presenter?.loadData(for: league, season: season)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: Constants.chooseSeasonsTitle, style: .plain, target: self, action: #selector(showSeasons))
    }
    
    @objc private func showSeasons() {
        picker = UIPickerView.init()
        picker.delegate = self
        picker.dataSource = self
        picker.backgroundColor = UIColor.white
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        picker.frame = CGRect(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(picker)
                
        toolBar = UIToolbar(frame: CGRect(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.items = [UIBarButtonItem.init(title: Constants.seasonChooseDoneTitle, style: .done, target: self, action: #selector(onDoneButtonTapped))]
        self.view.addSubview(toolBar)
    }
    
    @objc private func onDoneButtonTapped() {
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
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

extension StandingsViewController: StandingsView {
    func displayStandings(standings: [Standing]) {
        self.standings = standings
        tableView.reloadData()
    }
}

extension StandingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.isHidden = standings.isEmpty
        return standings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? StandingCell
        cell?.configure(model: standings[indexPath.row])
        return cell ?? UITableViewCell()
    }
}

extension StandingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return seasons.count
    }
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(seasons[row].year)
    }
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let league = league else {
            return
        }
        presenter?.loadData(for: league, season: String(seasons[row].year))
    }
}

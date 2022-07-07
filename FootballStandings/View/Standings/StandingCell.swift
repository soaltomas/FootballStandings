//
//  StandingCell.swift
//  FootballStandings
//
//  Created by Артем Полушин on 07.07.2022.
//

import UIKit

private extension StandingCell {
    struct Constants {
        static let logoAlpha: CGFloat = 0.1
        static let teamNameFont = UIFont.systemFont(ofSize: 24)
        static let locationFont = UIFont.systemFont(ofSize: 16)
        static let descriptionFont = UIFont.systemFont(ofSize: 16)
        static let statusFont = UIFont.systemFont(ofSize: 16)
        static let cellIdentifier = "StatCell"
        static let statsBackgroundColor = UIColor.clear
        static let statsBorderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        static let statsBorderWidth: CGFloat = 1
        static let activeColor = UIColor.green
        static let inactiveColor = UIColor.red
        static let contentHeight: CGFloat = 100
        static let statsSize = CGSize(width: 200, height: 100)
    }
}

final class StandingCell: UITableViewCell {
    
    var stats: [Stat] = []
    
    private lazy var logo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.alpha = Constants.logoAlpha
        return image
    }()
    
    private lazy var teamNameLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.teamNameFont
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.locationFont
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.descriptionFont
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.statusFont
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var statsView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(StatCell.self, forCellWithReuseIdentifier: Constants.cellIdentifier)
        collectionView.isUserInteractionEnabled = true
        collectionView.backgroundColor = Constants.statsBackgroundColor
        collectionView.layer.borderColor = Constants.statsBorderColor
        collectionView.layer.borderWidth = Constants.statsBorderWidth
        return collectionView
    }()
    
    func configure(model: Standing) {
        logo.loadFrom(urlString: model.team.logos.first?.link)
        teamNameLabel.text = model.team.displayName
        locationLabel.text = model.team.location
        descriptionLabel.text = model.note?.description
        statusLabel.text = model.team.isActive ? "Active" : "Inactive"
        statusLabel.textColor = model.team.isActive ? Constants.activeColor : Constants.inactiveColor
        descriptionLabel.isHidden = model.note?.description == nil
        stats = model.stats
        configure()
    }
    
    private func configure() {
        selectionStyle = .none
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        stackView.addArrangedSubview(teamNameLabel)
        stackView.addArrangedSubview(locationLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(statusLabel)
        stackView.addArrangedSubview(statsView)
        addSubview(logo)
        contentView.addSubview(stackView)
        contentView.addSubview(statsView)
    }
    
    private func makeConstraints() {
        logo.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalTo: widthAnchor),
            logo.heightAnchor.constraint(equalTo: heightAnchor),
            statsView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            statsView.heightAnchor.constraint(equalToConstant: Constants.contentHeight),
            statsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: statsView.topAnchor)
        ])
    }
}

extension StandingCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, for: indexPath) as? StatCell
        cell?.configure(model: stats[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}

extension StandingCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Constants.statsSize
    }
}

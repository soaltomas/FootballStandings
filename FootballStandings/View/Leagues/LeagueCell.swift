//
//  LeagueCell.swift
//  FootballStandings
//
//  Created by Артем Полушин on 06.07.2022.
//

import UIKit

private extension LeagueCell {
    struct Constants {
        static let abbreviationFont = UIFont.systemFont(ofSize: 12)
        static let abbreviationColor = UIColor.gray
        static let nameLeftInset: CGFloat = 10
        static let nameRightInset: CGFloat = 50
        static let abbreviationLeftInset: CGFloat = 10
        static let logoLeftInset: CGFloat = 50
        static let logoRightInset: CGFloat = -10
    }
}

final class LeagueCell: UITableViewCell {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var abbreviationLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.abbreviationFont
        label.textColor = Constants.abbreviationColor
        return label
    }()
    
    private lazy var logo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    func configure(model: League) {
        nameLabel.text = model.name
        abbreviationLabel.text = model.abbreviation
        logo.loadFrom(urlString: model.logos.light)
        configure()
    }
    
    private func configure() {
        selectionStyle = .none
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        addSubview(nameLabel)
        addSubview(abbreviationLabel)
        addSubview(logo)
    }
    
    private func makeConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        abbreviationLabel.translatesAutoresizingMaskIntoConstraints = false
        logo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.nameLeftInset),
            nameLabel.rightAnchor.constraint(equalTo: centerXAnchor, constant: Constants.nameRightInset),
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            abbreviationLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.abbreviationLeftInset),
            abbreviationLabel.topAnchor.constraint(equalTo: centerYAnchor),
            abbreviationLabel.bottomAnchor.constraint(equalTo: bottomAnchor),

            logo.heightAnchor.constraint(equalTo: heightAnchor),
            logo.rightAnchor.constraint(equalTo: rightAnchor, constant: Constants.logoRightInset),
            logo.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: Constants.logoLeftInset)
        ])
    }
}

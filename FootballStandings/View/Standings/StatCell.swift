//
//  StatCell.swift
//  FootballStandings
//
//  Created by Артем Полушин on 07.07.2022.
//

import UIKit

private extension StatCell {
    struct Constants {
        static let descriptionFont = UIFont.systemFont(ofSize: 12)
        static let goalsFont = UIFont.systemFont(ofSize: 36)
        static let contentLeftInset: CGFloat = 10
        static let contentRightInset: CGFloat = -10
    }
}

final class StatCell: UICollectionViewCell {
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.descriptionFont
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var goalsLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.goalsFont
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    func configure(model: Stat) {
        nameLabel.text = model.displayName
        descriptionLabel.text = model.description
        goalsLabel.text = model.displayValue
        configure()
    }
    
    private func configure() {
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(goalsLabel)
        addSubview(stackView)
    }
    
    private func makeConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.contentLeftInset),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: Constants.contentRightInset),
            stackView.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
}

//
//  SeasonCell.swift
//  FootballStandings
//
//  Created by Артем Полушин on 06.07.2022.
//

import UIKit

private extension SeasonCell {
    struct Constants {
        static let secondTextFont = UIFont.systemFont(ofSize: 12)
        static let contentLeftInset: CGFloat = 10
        static let contentRightInset: CGFloat = -10
    }
}

final class SeasonCell: UITableViewCell {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.secondTextFont
        return label
    }()
    
    private lazy var startDateLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.secondTextFont
        return label
    }()
    
    private lazy var endDateLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.secondTextFont
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    func configure(model: Season) {
        nameLabel.text = model.displayName
        yearLabel.text = "Year: \(String(model.year))"
        let startDate = DateFormatter.getDateFromString(date: model.startDate) ?? Date()
        let startDateString = DateFormatter.getStringFromDate(date: startDate) ?? ""
        let endDate = DateFormatter.getDateFromString(date: model.endDate) ?? Date()
        let endDateString = DateFormatter.getStringFromDate(date: endDate) ?? ""
        startDateLabel.text = "Start: \(startDateString)"
        endDateLabel.text = "End: \(endDateString)"
        configure()
    }
    
    private func configure() {
        selectionStyle = .none
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(yearLabel)
        stackView.addArrangedSubview(startDateLabel)
        stackView.addArrangedSubview(endDateLabel)
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

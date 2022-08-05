//
//  File.swift
//  
//
//  Created by Harish Kumar Yadav on 05/08/22.
//

import UIKit

public protocol CryptoCellModelType {
    var name: String { get }
    var percent: String { get }
    var price: String { get }
    var rank: String { get }
}

extension UITableViewCell {
    static var reuseIdentifier: String { String(describing: self) }
}

private enum Constant {
    static let horizontalMargin: CGFloat = 4
    static let priceWidth: CGFloat = 100
    static let percentWidth: CGFloat = 60
}

class MarketTableCell: UITableViewCell {

    private let rankLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let percentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MarketTableCell {

    func setup() {
        contentView.addSubview(rankLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(percentLabel)
        contentView.addSubview(priceLabel)
        setupConstarint()
    }

    func setupConstarint() {
        NSLayoutConstraint.activate([
            rankLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.horizontalMargin),
            rankLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: rankLabel.trailingAnchor, constant: Constant.horizontalMargin),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            percentLabel.leadingAnchor.constraint(greaterThanOrEqualTo: nameLabel.trailingAnchor, constant: Constant.horizontalMargin),
            percentLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            percentLabel.widthAnchor.constraint(equalToConstant: Constant.percentWidth),
            priceLabel.leadingAnchor.constraint(equalTo: percentLabel.trailingAnchor, constant: Constant.horizontalMargin),
            priceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constant.horizontalMargin),
            priceLabel.widthAnchor.constraint(equalToConstant: Constant.priceWidth),
        ])
    }
}

extension MarketTableCell {
    func configure(_ model: CryptoCellModelType) {
        rankLabel.text = model.rank
        nameLabel.text = model.name
        percentLabel.text = model.percent
        priceLabel.text = model.price
    }
}

//
//  LoadingCell.swift
//  RxDataSourcesIdentifiableType
//
//  Created by Florian Ludot on 11/8/22.
//

import UIKit

final class LoadingStateCell: UITableViewCell {
    let activityIndicator: UIActivityIndicatorView = {
        let aci = UIActivityIndicatorView(style: .medium)
        aci.translatesAutoresizingMaskIntoConstraints = false
        return aci
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = .white
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(activityIndicator)

        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
            activityIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0)
        ])

        activityIndicator.startAnimating()
    }
}


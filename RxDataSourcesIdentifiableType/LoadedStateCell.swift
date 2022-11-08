//
//  LoadedStateCell.swift
//  RxDataSourcesIdentifiableType
//
//  Created by Florian Ludot on 11/8/22.
//

import UIKit

final class LoadedStateCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = .white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

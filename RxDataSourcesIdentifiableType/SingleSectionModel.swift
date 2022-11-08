//
//  SingleSectionModel.swift
//  RxDataSourcesIdentifiableType
//
//  Created by Florian Ludot on 11/8/22.
//

import RxDataSources

struct SingleSectionModel<T: IdentifiableType & Equatable>: AnimatableSectionModelType {
    let identity = "singleSectionModelIdentity"
    let items: [T]

    init(original: SingleSectionModel<T>, items: [T]) {
        self.items = items
    }

    init(items: [T]) {
        self.items = items
    }
}

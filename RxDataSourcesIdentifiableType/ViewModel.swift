//
//  ViewModel.swift
//  RxDataSourcesIdentifiableType
//
//  Created by Florian Ludot on 11/8/22.
//

import Differentiator
import Foundation

struct ViewModel {
    enum State {
        case initialiazed
        case loading
        case loaded([Post])
    }

    enum ViewModelType: Equatable, IdentifiableType {
        case loading
        case post(Post)
        
        var identity: String {
            switch self {
            case .loading: return "???"
            case let .post(post): return String(post.id)
            }
        }
        
        static func == (lhs: ViewModel.ViewModelType, rhs: ViewModel.ViewModelType) -> Bool {
            switch (lhs, rhs) {
            case (.loading, .loading): return true
            case let (.post(l), .post(r)): return l == r
            default: return false
            }
        }
    }

    let state: State
    let viewModels: [ViewModelType]

    init(state: State) {
        self.state = state
        switch state {
        case .initialiazed:
            self.viewModels = []
        case .loading:
            self.viewModels = [.loading, .loading, .loading]
        case .loaded(let posts):
            self.viewModels = posts.map(ViewModelType.post)
        }
    }
}

//
//  ViewController.swift
//  RxDataSourcesIdentifiableType
//
//  Created by Florian Ludot on 11/8/22.
//

import RxCocoa
import RxDataSources
import RxSwift
import UIKit

final class ViewController: UITableViewController {
    typealias Section = SingleSectionModel<ViewModel.ViewModelType>

    let disposeBag = DisposeBag()
    let viewModel: BehaviorRelay<ViewModel>

    init() {
        self.viewModel = BehaviorRelay(value: ViewModel(state: .initialiazed))
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        tableView.dataSource = nil
        tableView.register(LoadedStateCell.self, forCellReuseIdentifier: "loaded")
        tableView.register(LoadingStateCell.self, forCellReuseIdentifier: "loading")
        tableView.rowHeight = 120

        let dataSource = RxTableViewSectionedAnimatedDataSource<Section>(configureCell: { _, tableView, indexPath, item in
            let returnCell: UITableViewCell
            switch item {
            case .loading:
                let cell = tableView.dequeueReusableCell(withIdentifier: "loading", for: indexPath) as! LoadingStateCell
                cell.textLabel?.text = String(indexPath.description)
                cell.detailTextLabel?.text = "Identity \(item.identity)"
                returnCell = cell
            case let .post(post):
                let cell = tableView.dequeueReusableCell(withIdentifier: "loaded", for: indexPath) as! LoadedStateCell
                cell.textLabel?.text = post.title
                cell.detailTextLabel?.text = "Identity \(item.identity)"
                returnCell = cell
            }
            return returnCell
        })

        viewModel
            .map { [SingleSectionModel(items: $0.viewModels)] }
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        fetchPosts()
    }

    private func fetchPosts() {
        viewModel.accept(ViewModel(state: .loading))
        Post.list()
            .subscribe(onSuccess: { [weak self] posts in
                guard let strongSelf = self else { return }
                strongSelf.viewModel.accept(ViewModel(state: .loaded(posts)))
            })
            .disposed(by: disposeBag)
    }
}

//
//  PostsViewController.swift
//  BabylonDemo
//
//  Created by inso on 06/12/2018.
//  Copyright (c) 2018 Thomas Moussajee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PostsViewController: UIViewController {
    fileprivate var viewModel: PostsViewModel?
    fileprivate var router: PostsRouter?
    fileprivate let disposeBag = DisposeBag()

	@IBOutlet weak var tableView: UITableView!

	static let storyboardIdentifier = "PostsViewController"
	static let storyboardName = "Posts"

    func configure(withViewModel viewModel: PostsViewModel, router: PostsRouter) {
        self.viewModel = viewModel
        self.router = router
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupLayout()
        setupRx()
    }
}

// MARK: Setup
private extension PostsViewController {

    func setupViews() {
        setupTableView()
    }

    func setupLayout() {

    }

    func setupRx() {
		let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
			.mapToVoid()
			.asDriverOnErrorJustComplete()
		let pull = tableView.refreshControl!.rx
			.controlEvent(.valueChanged)
			.asDriver()

		let input = PostsViewModel.Input(trigger: Driver.merge(viewWillAppear, pull),
										 selection: tableView.rx.itemSelected.asDriver())
		let output = viewModel?.transform(input: input)

		//Bind Posts to UITableView
		output?.posts.drive(self.tableView.rx.items(cellIdentifier: PostTableViewCell.reuseID, cellType: PostTableViewCell.self)) { _, viewModel, cell in
				cell.bind(viewModel)
			}.disposed(by: disposeBag)

		output?.fetching
			.drive(tableView.refreshControl!.rx.isRefreshing)
			.disposed(by: disposeBag)
		output?.selectedPost.do(onNext: self.router?.navigatetoPost(_:))
			.drive()
			.disposed(by: disposeBag)
	}
}

// tableView
private extension PostsViewController {

	func setupTableView() {
		tableView.refreshControl = UIRefreshControl()
		tableView.estimatedRowHeight = 64
		tableView.rowHeight = UITableView.automaticDimension
	}
}

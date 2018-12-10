//
//  PostDetailsViewController.swift
//  BabylonDemo
//
//  Created by inso on 07/12/2018.
//  Copyright (c) 2018 Thomas Moussajee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Domain

class PostDetailsViewController: UIViewController {
    fileprivate var viewModel: PostDetailsViewModel?
    fileprivate var router: PostDetailsRouter?
    fileprivate let disposeBag = DisposeBag()

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var detailsLabel: UILabel!
	@IBOutlet weak var userLabel: UILabel!
	@IBOutlet weak var numberOfComments: UILabel!

	static let storyboardIdentifier = "PostDetailsViewController"
	static let storyboardName = "PostDetails"

	func configure(withViewModel viewModel: PostDetailsViewModel, router: PostDetailsRouter) {
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
private extension PostDetailsViewController {

    func setupViews() {

    }

    func setupLayout() {

    }

    func setupRx() {
		let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
			.mapToVoid()
			.asDriverOnErrorJustComplete()

		var postBinding: Binder<Post> {
			return Binder(self, binding: { (vc, post) in
				vc.titleLabel.text = post.title
				vc.detailsLabel.text = post.body
				vc.numberOfComments.text = "Number Of comments:" + ((post.numberOfComments != nil) ? "\(post.numberOfComments!)" : "0")
				vc.userLabel.text = "Authors:" + ((post.userName != nil) ? "\(post.userName!)" : "Unknow")
			})
		}

		let input = PostDetailsViewModel.Input(
			triggerComments: viewWillAppear,
			triggerUser: viewWillAppear
		)

		let output = viewModel?.transform(input: input)

		output?.post.drive(postBinding).disposed(by: disposeBag)
    }
}

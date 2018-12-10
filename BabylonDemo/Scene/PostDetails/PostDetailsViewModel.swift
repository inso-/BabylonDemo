//
//  PostDetailsViewModel.swift
//  BabylonDemo
//
//  Created by inso on 07/12/2018.
//  Copyright (c) 2018 Thomas Moussajee. All rights reserved.
//

import RxSwift
import RxCocoa
import Domain

class PostDetailsViewModel {
	private let post: Post

    // input
	struct Input {
		let triggerComments: Driver<Void>
		let triggerUser: Driver<Void>
	}
    // output
	struct Output {
		let fetching: Driver<Bool>
		let post: Driver<Post>
		let error: Driver<Error>
	}

	private let commentsUseCase: CommentsUseCase
	private let userUseCase: UserUseCase

	func transform(input: Input) -> Output {

		let activityIndicator = ActivityIndicator()
		let errorTracker = ErrorTracker()
		let commentsCount = input.triggerComments.flatMapLatest { [unowned self] _ in
			return self.commentsUseCase.getComments(postId: self.post.id)
				.trackActivity(activityIndicator)
				.trackError(errorTracker)
				.startWith([])
				.asDriverOnErrorJustComplete()
				.map { CommentsItemViewModel(with: $0.count) }
		}

		let userName = input.triggerUser.flatMapLatest { [unowned self] _ in
			return self.userUseCase.getUser(userId: self.post.userId)
				.trackActivity(activityIndicator)
				.trackError(errorTracker)
				.asDriverOnErrorJustComplete()
				.map { UserItemViewModel(with: $0.username) }
		}

		let fetching = activityIndicator.asDriver()
		let errors = errorTracker.asDriver()

		let post = Driver.combineLatest(Driver.just(self.post), commentsCount, userName) { (post: Post, commentsCount: CommentsItemViewModel, userName: UserItemViewModel) -> Post in

			return Post(body: post.body ?? "", userId: post.userId, id: post.id, title: post.title, numberOfComments: commentsCount.count, userName: userName.username)
			}.startWith(self.post)

		return Output(fetching: fetching, post: post, error: errors)
	}

    // internal

	init(post: Post,
		 commentsUseCase: CommentsUseCase,
		 userUseCase: UserUseCase) {
		self.commentsUseCase = commentsUseCase
		self.userUseCase = userUseCase
		self.post = post
    }
}

// MARK: subViewModel

final class CommentsItemViewModel {
	let count: Int
	init (with count: Int) {
		self.count = count
	}
}

final class UserItemViewModel {
	let username: String
	init (with username: String) {
		self.username = username
	}
}

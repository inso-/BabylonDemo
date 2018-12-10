//
//  PostsViewModel.swift
//  BabylonDemo
//
//  Created by inso on 06/12/2018.
//  Copyright (c) 2018 Thomas Moussajee. All rights reserved.
//

import RxSwift
import RxCocoa
import Domain

class PostsViewModel {

    // input
	struct Input {
		let trigger: Driver<Void>
		let selection: Driver<IndexPath>
	}
    // output

	struct Output {
		let fetching: Driver<Bool>
		let posts: Driver<[PostItemViewModel]>
		let selectedPost: Driver<Post>
		let error: Driver<Error>
	}

    // internal

	private let useCase: PostsUseCase

    init(useCase: PostsUseCase) {
		self.useCase = useCase
    }

	func transform(input: Input) -> Output {
		let activityIndicator = ActivityIndicator()
		let errorTracker = ErrorTracker()
		let posts = input.trigger.flatMapLatest { _ in
			return self.useCase.getPosts()
				.trackActivity(activityIndicator)
				.trackError(errorTracker)
				.asDriverOnErrorJustComplete()
				.map { $0.map { PostItemViewModel(with: $0) } }
		}

		let fetching = activityIndicator.asDriver()
		let errors = errorTracker.asDriver()
		let selectedPost = input.selection
			.withLatestFrom(posts) { (indexPath, posts) -> Post in
				return posts[indexPath.row].post
			}

		return Output(fetching: fetching,
					  posts: posts,
					  selectedPost: selectedPost,
					  error: errors)
	}
}

// MARK: subViewModel

final class PostItemViewModel {
	let title: String
	let post: Post
	init (with post: Post) {
		self.post = post
		self.title = post.title
	}
}

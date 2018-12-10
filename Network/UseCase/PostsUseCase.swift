//
//  GetPostsUseCase.swift
//  Network
//
//  Created by inso on 06/12/2018.
//  Copyright © 2018 Thomas Moussajee. All rights reserved.
//

import RxSwift
import Domain

final class PostsUseCase: Domain.PostsUseCase {

	private let network: PostsNetwork

	init(network: PostsNetwork) {
		self.network = network
	}

	func getPosts() -> Observable<[Post]> {
		let stored = network.fetchPosts()
			.flatMap {
				return Observable.just($0)
		}

		return stored
	}
}

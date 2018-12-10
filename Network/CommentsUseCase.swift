//
//  GetCommentsUseCase.swift
//  Network
//
//  Created by inso on 07/12/2018.
//  Copyright © 2018 Thomas Moussajee. All rights reserved.
//

import RxSwift
import Domain

final class CommentsUseCase: Domain.CommentsUseCase {

	private let network: CommentsNetwork

	init(network: CommentsNetwork) {
		self.network = network
	}

	func getComments(postId: Int) -> Observable<[Comment]> {
		let stored = network.fetchComments(postId: "\(postId)")
			.flatMap {
				return Observable.just($0)
		}
		return stored
	}
}

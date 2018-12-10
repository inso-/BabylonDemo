//
//  CommentsNetwork.swift
//  BabylonDemo
//
//  Created by inso on 07/12/2018.
//  Copyright © 2018 Thomas Moussajee. All rights reserved.
//

import Foundation
import Domain
import RxSwift

public final class CommentsNetwork {
	private let network: Network<Comment>

	init(network: Network<Comment>) {
		self.network = network
	}

	public func fetchComments() -> Observable<[Comment]> {
		return network.getItems("comments")
	}

	public func fetchComments(postId: String) -> Observable<[Comment]> {
		return network.getItems("comments", itemId: "postId=\(postId)")
	}
}

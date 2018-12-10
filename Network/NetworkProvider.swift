//
//  NetworkProvider.swift
//  Network
//
//  Created by inso on 06/12/2018.
//  Copyright © 2018 Thomas Moussajee. All rights reserved.
//

import Domain

final class NetworkProvider {
	private let apiEndpoint: String

	public init() {
		apiEndpoint = "https://jsonplaceholder.typicode.com"
	}

	public func makePostsNetwork() -> PostsNetwork {
		let network = Network<Post>(apiEndpoint)
		return PostsNetwork(network: network)
	}

	public func makeCommentsNetwork() -> CommentsNetwork {
		let network = Network<Comment>(apiEndpoint)
		return CommentsNetwork(network: network)
	}

	public func makeUserNetwork() -> UserNetwork {
		let network = Network<User>(apiEndpoint)
		return UserNetwork(network: network)
	}
}

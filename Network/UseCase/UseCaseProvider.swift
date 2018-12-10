//
//  UseCaseProvider.swift
//  BabylonDemo
//
//  Created by inso on 06/12/2018.
//  Copyright © 2018 Thomas Moussajee. All rights reserved.
//

import Foundation
import Domain

public final class UseCaseProvider: Domain.UseCaseProvider {

	private let networkProvider: NetworkProvider

	public init() {
		networkProvider = NetworkProvider()
	}

	public func makePostsUseCase() -> Domain.PostsUseCase {
		return PostsUseCase(network: networkProvider.makePostsNetwork())
	}

	public func makeCommentsUsecase(postId: Int) -> Domain.CommentsUseCase {
		return CommentsUseCase(network: networkProvider.makeCommentsNetwork())
	}

	public func makeUserUseCase(userId: Int) -> Domain.UserUseCase {
		return UserUseCase(network: networkProvider.makeUserNetwork())
	}

}

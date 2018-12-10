//
//  UseCaseProvider.swift
//  Domain
//
//  Created by inso on 06/12/2018.
//  Copyright © 2018 Thomas Moussajee. All rights reserved.
//

import Foundation

public protocol UseCaseProvider {
	func makePostsUseCase() -> PostsUseCase
	func makeCommentsUsecase(postId: Int) -> CommentsUseCase
	func makeUserUseCase(userId: Int) -> UserUseCase
}

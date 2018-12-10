//
//  PostDetailsBuilder.swift
//  BabylonDemo
//
//  Created by inso on 07/12/2018.
//  Copyright (c) 2018 Thomas Moussajee. All rights reserved.
//

import UIKit
import Domain

struct PostDetailsBuilder {

	static func viewController(post: Post,
							   usecaseProvider: UseCaseProvider,
							   navigationController: UINavigationController,
							   storyboard: UIStoryboard) -> UIViewController {
		let viewModel = PostDetailsViewModel(post: post,
											 commentsUseCase: usecaseProvider.makeCommentsUsecase(postId: post.id),
											 userUseCase: usecaseProvider.makeUserUseCase(userId: post.userId))
        let router = PostDetailsRouter()
		let viewController: PostDetailsViewController = storyboard.instantiateViewController(withIdentifier: PostDetailsViewController.storyboardIdentifier) as! PostDetailsViewController
		viewController.configure(withViewModel: viewModel, router: router)
        router.viewController = viewController

        return viewController
    }
}

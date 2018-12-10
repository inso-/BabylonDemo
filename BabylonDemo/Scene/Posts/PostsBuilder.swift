//
//  PostsBuilder.swift
//  BabylonDemo
//
//  Created by inso on 06/12/2018.
//  Copyright (c) 2018 Thomas Moussajee. All rights reserved.
//

import UIKit
import Domain

struct PostsBuilder {

	static func viewController(useCaseProvider: UseCaseProvider, navigationController: UINavigationController, storyboard: UIStoryboard) -> UIViewController {
		let viewModel = PostsViewModel(useCase: useCaseProvider.makePostsUseCase())
		let router = PostsRouter(services: useCaseProvider, navigationController: navigationController, storyBoard: storyboard)
		let viewController: PostsViewController = storyboard.instantiateViewController(withIdentifier: PostsViewController.storyboardIdentifier) as! PostsViewController
		viewController.configure(withViewModel: viewModel, router: router)
		router.viewController = viewController

        return viewController
    }
}

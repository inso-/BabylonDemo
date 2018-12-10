//
//  PostsRouter.swift
//  BabylonDemo
//
//  Created by inso on 06/12/2018.
//  Copyright (c) 2018 Thomas Moussajee. All rights reserved.
//

import Foundation
import Domain
import NetworkAPI

class PostsRouter {
    weak var viewController: PostsViewController?
	private let services: Domain.UseCaseProvider
	private let storyBoard: UIStoryboard
	private let navigationController: UINavigationController

	init(services: Domain.UseCaseProvider,
		 navigationController: UINavigationController,
		 storyBoard: UIStoryboard) {
		self.storyBoard = storyBoard
		self.services = services
		self.navigationController = navigationController
	}

	func navigatetoPost(_ post: Post) {
		let storyboard = UIStoryboard(name: PostDetailsViewController.storyboardName, bundle: nil)
		let networkUseCaseProvider: Domain.UseCaseProvider
		networkUseCaseProvider = NetworkAPI.UseCaseProvider()

		let vc = PostDetailsBuilder.viewController(post: post, usecaseProvider: networkUseCaseProvider, navigationController: self.navigationController, storyboard: storyboard)
		navigationController.pushViewController(vc, animated: true)
	}
}

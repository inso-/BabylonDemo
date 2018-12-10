//
//  RootNavigationController.swift
//  BabylonDemo
//
//  Created by inso on 06/12/2018.
//  Copyright © 2018 Thomas Moussajee. All rights reserved.
//

import Foundation
import UIKit
import NetworkAPI
import Domain

class RootNavigationController: UINavigationController {

	override func viewDidLoad() {
		super.viewDidLoad()
		let networkUseCaseProvider: Domain.UseCaseProvider
		networkUseCaseProvider = NetworkAPI.UseCaseProvider()

		let storyboard = UIStoryboard(name: PostsViewController.storyboardName, bundle: nil)
		let postsNavigator = PostsBuilder.viewController(useCaseProvider: networkUseCaseProvider, navigationController: self, storyboard: storyboard)
		self.viewControllers = [postsNavigator]
	}
}

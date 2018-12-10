//
//  UsersNetwork.swift
//  BabylonDemo
//
//  Created by inso on 07/12/2018.
//  Copyright © 2018 Thomas Moussajee. All rights reserved.
//

import Foundation

import Domain
import RxSwift

public final class UserNetwork {
	private let network: Network<User>

	init(network: Network<User>) {
		self.network = network
	}

	public func fetchUser(userId: String) -> Observable<User> {
		return network.getItem("users", itemId: userId)
	}
}

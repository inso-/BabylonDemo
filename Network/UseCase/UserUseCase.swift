//
//  GetUsersUseCase.swift
//  Network
//
//  Created by inso on 07/12/2018.
//  Copyright © 2018 Thomas Moussajee. All rights reserved.
//

import RxSwift
import Domain

final class UserUseCase: Domain.UserUseCase {

	private let network: UserNetwork

	init(network: UserNetwork) {
		self.network = network
	}

	func getUser(userId: Int) -> Observable<User> {
		let stored = network.fetchUser(userId: "\(userId)")
			.flatMap {
				return Observable.just($0)
		}
		return stored
	}
}

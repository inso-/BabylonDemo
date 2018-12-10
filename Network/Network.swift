//
//  Network.swift
//  Network
//
//  Created by inso on 06/12/2018.
//  Copyright © 2018 Thomas Moussajee. All rights reserved.
//

import Foundation
import Alamofire
import Domain
import RxAlamofire
import RxSwift

final class Network<T: Decodable> {

	private let endPoint: String
	private let scheduler: ConcurrentDispatchQueueScheduler

	init(_ endPoint: String) {
		self.endPoint = endPoint
		self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
	}

	func getItems(_ path: String) -> Observable<[T]> {
		let absolutePath = "\(endPoint)/\(path)"
		return RxAlamofire
			.data(.get, absolutePath)
			.observeOn(scheduler)
			.map({ data -> [T] in
				return try JSONDecoder().decode([T].self, from: data)
			})
	}

	func getItems(_ path: String, itemId: String) -> Observable<[T]> {
		let absolutePath = "\(endPoint)/\(path)?\(itemId)"
		return RxAlamofire
			.data(.get, absolutePath)
			.observeOn(scheduler)
			.map({ data -> [T] in
				return try JSONDecoder().decode([T].self, from: data)
			})
	}

	func getItem(_ path: String, itemId: String) -> Observable<T> {
		let absolutePath = "\(endPoint)/\(path)/\(itemId)"
		return RxAlamofire
			.data(.get, absolutePath)
			.observeOn(scheduler)
			.map({ data -> T in
				return try JSONDecoder().decode(T.self, from: data)
			})
	}
}

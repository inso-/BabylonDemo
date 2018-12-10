//
//  Observable+Ext.swift
//  BabylonDemo
//
//  Created by inso on 06/12/2018.
//  Copyright © 2018 Thomas Moussajee. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension ObservableType {
	// Useful for mapping an Observable<Whatever> into an Observable<Void> to hide details.
	public func mapToVoid() -> Observable<Void> {
		return self.map { _ -> Void in
			return ()
		}
	}

	func asDriverOnErrorJustComplete() -> Driver<E> {
		return asDriver { _ in
			return Driver.empty()
		}
	}
}

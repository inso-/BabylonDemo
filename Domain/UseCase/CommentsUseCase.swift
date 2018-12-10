//
//  GetPostsUseCase.swift
//  Domain
//
//  Created by inso on 07/12/2018.
//  Copyright © 2018 Thomas Moussajee. All rights reserved.
//

import Foundation
import RxSwift

public protocol CommentsUseCase {
	func getComments(postId: Int) -> Observable<[Comment]>
}

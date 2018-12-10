//
//  GetPostsUseCase.swift
//  Domain
//
//  Created by inso on 06/12/2018.
//  Copyright © 2018 Thomas Moussajee. All rights reserved.
//

import Foundation
import RxSwift

public protocol PostsUseCase {
    func getPosts() -> Observable<[Post]>

}

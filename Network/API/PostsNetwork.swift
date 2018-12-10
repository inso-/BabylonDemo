//
//  CommentsNetwork.swift
//  BabylonDemo
//
//  Created by inso on 06/12/2018.
//  Copyright © 2018 Thomas Moussajee. All rights reserved.
//

import Domain
import RxSwift

public final class PostsNetwork {
    private let network: Network<Post>

    init(network: Network<Post>) {
        self.network = network
    }

    public func fetchPosts() -> Observable<[Post]> {
        return network.getItems("posts")
    }

    public func fetchPost(postId: String) -> Observable<Post> {
        return network.getItem("posts", itemId: postId)
    }

}

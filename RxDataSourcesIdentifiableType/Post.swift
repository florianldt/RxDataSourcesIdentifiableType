//
//  Post.swift
//  RxDataSourcesIdentifiableType
//
//  Created by Florian Ludot on 11/8/22.
//

import Foundation
import RxSwift

struct Post: Decodable, Equatable, Hashable {
    let body: String
    let id: Int
    let title: String
}

extension Post {
    static func list() -> Single<[Post]> {
        return .just([
            Post(body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto", id: 1, title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"),
            Post(body: "est rerum tempore vitae sequi sint nihil reprehenderit dolor beatae ea dolores neque fugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis qui aperiam non debitis possimus qui neque nisi nulla", id: 2, title: "qui est esse"),
            Post(body: "et iusto sed quo iure voluptatem occaecati omnis eligendi aut ad voluptatem doloribus vel accusantium quis pariatur molestiae porro eius odio et labore et velit aut", id: 3, title: "ea molestias quasi exercitationem repellat qui ipsa sit aut"),
        ]).delay(.seconds(4), scheduler: MainScheduler.instance)
    }
}

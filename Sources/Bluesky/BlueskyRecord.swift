//
//  Created by Jesse Squires.
//  https://www.jessesquires.com
//
//  GitHub
//  https://github.com/jessesquires/mariposa
//
//  Copyright © 2025-present Jesse Squires
//

import Foundation

struct BlueskyRecord: Hashable, Codable {
    let text: String
    let createdAt: String
    var facets: [BlueskyFacet]

    init(text: String) {
        self.text = text
        self.createdAt = Date.now.ISO8601Format()
        self.facets = []
    }

    init(jsonFeedItem post: JSONFeedItem) {
        let text = "\(post.title)\n\n\(post.url)"
        self.init(text: text)

        let link = BlueskyFacetFeature(uri: post.url.absoluteString, type: "app.bsky.richtext.facet#link")
        let index = BlueskyIndex(byteStart: post.title.count + 2, byteEnd: text.count)
        self.facets = [
            BlueskyFacet(features: [link], index: index)
        ]
    }
}

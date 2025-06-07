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

public struct BlueskyRecord: Hashable, Codable {
    public let text: String
    public let createdAt: String
    public var facets: [BlueskyFacet]

    public init(text: String) {
        self.text = text
        self.createdAt = Date.now.ISO8601Format()
        self.facets = []
    }

    public init(jsonFeedItem post: JSONFeedItem) {
        let text = "\(post.title)\n\n\(post.url)"
        self.init(text: text)

        let link = BlueskyFacetFeature(uri: post.url.absoluteString, type: "app.bsky.richtext.facet#link")
        let index = BlueskyIndex(byteStart: post.title.count + 2, byteEnd: text.count)
        self.facets = [
            BlueskyFacet(features: [link], index: index)
        ]
    }
}

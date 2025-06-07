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

public struct JSONFeedClient: Hashable {
    public let filePath: String

    public var url: URL {
        URL(filePath: self.filePath)
    }

    public func loadFeed() throws -> JSONFeed {
        let data = try Data(contentsOf: self.url)
        return try JSONDecoder().decode(JSONFeed.self, from: data)
    }

    public func latestPost() throws -> JSONFeedItem? {
        let feed = try self.loadFeed()
        return feed.items.first
    }
}

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

public struct JSONFeed: Hashable, Codable {
    public let items: [JSONFeedItem]

    public var latest: JSONFeedItem? {
        self.items.first
    }

    public init(items: [JSONFeedItem]) {
        self.items = items
    }

    public init(filePath: String) throws {
        let url = URL(filePath: filePath)
        let data = try Data(contentsOf: url)
        self = try JSONDecoder().decode(Self.self, from: data)
    }
}

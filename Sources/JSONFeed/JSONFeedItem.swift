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

public struct JSONFeedItem: Hashable, Codable {
    public let title: String
    public let url: URL

    var preview: String {
        let count = max(self.title.count, self.url.absoluteString.count)
        let border = String(repeating: "*", count: count + 4)
        return """
        Post Preview:
        \(border)
        *   \(self.title)
        *
        *   \(self.url)
        \(border)
        """
    }
}

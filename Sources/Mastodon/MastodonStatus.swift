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

public struct MastodonStatus: Hashable {
    public let text: String

    public var httpBody: Data {
        Data(self.text.utf8)
    }

    public init(text: String) {
        self.text = text
    }

    public init(jsonFeedItem post: JSONFeedItem) {
        let text = """
        status=\(post.title)

        \(post.url)
        """
        self.init(text: text)
    }
}

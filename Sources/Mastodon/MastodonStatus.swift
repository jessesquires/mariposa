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

struct MastodonStatus: Hashable {
    let text: String

    var httpBody: Data {
        Data(self.text.utf8)
    }

    init(text: String) {
        self.text = text
    }

    init(jsonFeedItem post: JSONFeedItem) {
        let text = """
        status=\(post.title)

        \(post.url)
        """
        self.init(text: text)
    }
}

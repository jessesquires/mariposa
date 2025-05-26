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

    init(text: String) {
        self.text = text
        self.createdAt = Date.now.ISO8601Format()
    }
}

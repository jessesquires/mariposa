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

struct BlueskyPost: Hashable, Codable {
    let repo: String
    let collection: String
    let validate: Bool
    let record: BlueskyRecord

    init(session: BlueskySession, record: BlueskyRecord) {
        self.repo = session.did
        self.collection = "app.bsky.feed.post"
        self.validate = true
        self.record = record
    }
}

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

public struct BlueskyPost: Hashable, Codable {
    public let repo: String
    public let collection: String
    public let validate: Bool
    public let record: BlueskyRecord

    public init(session: BlueskySession, record: BlueskyRecord) {
        self.repo = session.did
        self.collection = "app.bsky.feed.post"
        self.validate = true
        self.record = record
    }
}

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

public struct BlueskyResult: Hashable, Sendable {
    public let session: BlueskySession
    public let record: BlueskyRecordCreated
}

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
import Yams

public struct MariposaConfig: Hashable, Codable {
    public let bluesky: BlueskyCredentials

    public let mastodon: MastodonCredentials

    public init(bluesky: BlueskyCredentials, mastodon: MastodonCredentials) {
        self.bluesky = bluesky
        self.mastodon = mastodon
    }

    public init(filePath: URL) throws {
        let data = try Data(contentsOf: filePath)
        self = try YAMLDecoder().decode(Self.self, from: data)
    }
}

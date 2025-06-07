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

public struct MastodonClient: Hashable {
    public let credentials: MastodonCredentials

    public func share(feedItem: JSONFeedItem) async throws -> MastodonResult? {
        let status = MastodonStatus(jsonFeedItem: feedItem)
        let request = try URLRequest.mastodonCreatePost(credentials: self.credentials, status: status)
        let (data, response) = try await URLSession.shared.data(for: request)
        if !response.isSuccess {
            return nil
        }
        return MastodonResult(data: data)
    }
}

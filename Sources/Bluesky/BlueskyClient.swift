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

public struct BlueskyClient: Hashable {
    public let credentials: BlueskyCredentials

    public func share(feedItem: JSONFeedItem) async throws -> BlueskyResult? {
        let createSessionRequest = try URLRequest.blueskyCreateSession(credentials: self.credentials)
        let (sessionData, sessionResponse) = try await URLSession.shared.data(for: createSessionRequest)
        if !sessionResponse.isSuccess {
            return nil
        }
        let session = try JSONDecoder().decode(BlueskySession.self, from: sessionData)

        let post = BlueskyRecord(jsonFeedItem: feedItem)
        let createPostRequest = try URLRequest.blueskyCreatePost(session: session, record: post)
        let (postData, postResponse) = try await URLSession.shared.data(for: createPostRequest)
        if !postResponse.isSuccess {
            return nil
        }
        let recordCreated = try JSONDecoder().decode(BlueskyRecordCreated.self, from: postData)

        return BlueskyResult(session: session, record: recordCreated)
    }
}

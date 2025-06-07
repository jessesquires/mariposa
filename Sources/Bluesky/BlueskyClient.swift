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

struct BlueskyClient: Hashable {
    let credentials: BlueskyCredentials

    func share(feedItem: JSONFeedItem) async throws -> BlueskyResult? {
        let createSessionRequest = try URLRequest.blueskyCreateSession(credentials: self.credentials)
        let (sessionData, sessionResponse) = try await URLSession.shared.data(for: createSessionRequest)
        let session = try JSONDecoder().decode(BlueskySession.self, from: sessionData)
        if !sessionResponse.isSuccess {
            return nil
        }

        let post = BlueskyRecord(jsonFeedItem: feedItem)
        let createPostRequest = try URLRequest.blueskyCreatePost(session: session, record: post)
        let (postData, postResponse) = try await URLSession.shared.data(for: createPostRequest)
        let recordCreated = try JSONDecoder().decode(BlueskyRecordCreated.self, from: postData)
        if !postResponse.isSuccess {
            return nil
        }

        return BlueskyResult(session: session, record: recordCreated)
    }
}

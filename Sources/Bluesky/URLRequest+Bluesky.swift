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

extension URLRequest {
    public static func blueskyCreateSession(credentials: BlueskyCredentials) throws -> Self {
        let url = URL(string: "https://bsky.social/xrpc/com.atproto.server.createSession")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let json = BlueskyCreateSession(credentials: credentials)
        request.httpBody = try JSONEncoder().encode(json)
        return request
    }

    public static func blueskyCreatePost(session: BlueskySession, record: BlueskyRecord) throws -> Self {
        let url = URL(string: "https://bsky.social/xrpc/com.atproto.repo.createRecord")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(session.accessJwt)", forHTTPHeaderField: "Authorization")
        let json = BlueskyPost(session: session, record: record)
        request.httpBody = try JSONEncoder().encode(json)
        return request
    }
}

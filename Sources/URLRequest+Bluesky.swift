//
//  GitHub
//  https://github.com/jessesquires/mariposa
//
//  Copyright © 2025 Jesse Squires
//  https://www.jessesquires.com
//

import Foundation

extension URLRequest {
    static func blueskyCreateSession(email: String, password: String) throws -> Self {
        let url = URL(string: "https://bsky.social/xrpc/com.atproto.server.createSession")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let json = BlueskyCreateSession(identifier: email, password: password)
        request.httpBody = try JSONEncoder().encode(json)
        return request
    }
}

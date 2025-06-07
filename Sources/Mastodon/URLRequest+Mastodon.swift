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
    public static func mastodonCreatePost(credentials: MastodonCredentials, status: MastodonStatus) throws -> Self {
        var request = URLRequest(url: credentials.statusesURL)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(credentials.accessToken)", forHTTPHeaderField: "Authorization")
        request.httpBody = status.httpBody
        return request
    }
}

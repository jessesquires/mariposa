//
//  Created by Jesse Squires.
//  https://www.jessesquires.com
//
//  GitHub
//  https://github.com/jessesquires/mariposa
//
//  Copyright © 2025-present Jesse Squires
//

public struct BlueskyCreateSession: Hashable, Codable {
    public let identifier: String
    public let password: String

    public init(credentials: BlueskyCredentials) {
        self.identifier = credentials.email
        self.password = credentials.password
    }
}

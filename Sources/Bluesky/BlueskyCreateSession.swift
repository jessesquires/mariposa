//
//  Created by Jesse Squires.
//  https://www.jessesquires.com
//
//  GitHub
//  https://github.com/jessesquires/mariposa
//
//  Copyright © 2025-present Jesse Squires
//

struct BlueskyCreateSession: Hashable, Codable {
    let identifier: String
    let password: String

    init(credentials: BlueskyCredentials) {
        self.identifier = credentials.email
        self.password = credentials.password
    }
}

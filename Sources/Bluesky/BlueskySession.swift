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

public struct BlueskySession: Hashable, Codable, Sendable {
    public let accessJwt: String
    public let refreshJwt: String
    public let email: String
    public let handle: String
    public let did: String
}

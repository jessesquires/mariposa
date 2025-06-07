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

public struct MastodonAccount: Hashable, Codable {
    public let uri: String
    public let url: String
    public let username: String
}

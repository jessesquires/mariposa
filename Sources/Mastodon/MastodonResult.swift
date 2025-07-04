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

public struct MastodonResult: Hashable, Codable {
    public let account: MastodonAccount
    public let uri: String
    public let url: String
}

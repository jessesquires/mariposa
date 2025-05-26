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

struct BlueskySession: Hashable, Codable {
    let accessJwt: String
    let refreshJwt: String
    let email: String
    let handle: String
    let did: String
}

//
//  GitHub
//  https://github.com/jessesquires/mariposa
//
//  Copyright © 2025 Jesse Squires
//  https://www.jessesquires.com
//

import Foundation

struct BlueskySession: Hashable, Codable {
    let accessJwt: String
    let refreshJwt: String
    let email: String
    let handle: String
    let did: String
}

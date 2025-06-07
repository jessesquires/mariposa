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

struct MastodonCredentials: Hashable {
    let instanceName: String
    let accessToken: String

    var statusesURL: URL {
        URL(string: "https://\(self.instanceName)/api/v1/statuses")!
    }
}

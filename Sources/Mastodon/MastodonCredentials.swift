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

public struct MastodonCredentials: Hashable {
    public let instanceName: String
    public let accessToken: String

    public var statusesURL: URL {
        URL(string: "https://\(self.instanceName)/api/v1/statuses")!
    }
}

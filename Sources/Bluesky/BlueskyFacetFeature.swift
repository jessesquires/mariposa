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

public struct BlueskyFacetFeature: Hashable, Codable {
    public let uri: String
    public let type: String

    enum CodingKeys: String, CodingKey {
        case uri
        case type = "$type"
    }
}

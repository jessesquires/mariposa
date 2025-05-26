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

struct BlueskyFacetFeature: Hashable, Codable {
    let uri: String
    let type: String

    enum CodingKeys: String, CodingKey {
        case uri
        case type = "$type"
    }
}

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

public struct BlueskyFacet: Hashable, Codable {
    public let features: [BlueskyFacetFeature]
    public let index: BlueskyIndex
}

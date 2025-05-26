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

struct BlueskyFacet: Hashable, Codable {
    let features: [BlueskyFacetFeature]
    let index: BlueskyIndex
}

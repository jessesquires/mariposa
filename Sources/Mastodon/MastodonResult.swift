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

public struct MastodonResult: Hashable, Sendable {
    public let data: Data

    public var json: Any? {
        try? JSONSerialization.jsonObject(with: self.data)
    }
}

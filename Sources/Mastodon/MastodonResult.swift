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

struct MastodonResult: Hashable {
    let data: Data

    var json: Any? {
        try? JSONSerialization.jsonObject(with: self.data)
    }
}

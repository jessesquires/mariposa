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

extension URLResponse {
    var isSuccess: Bool {
        (self as? HTTPURLResponse)?.statusCode == 200
    }
}

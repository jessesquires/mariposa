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

extension String {
    var isYes: Bool {
        self.localizedLowercase == "yes" || self.localizedLowercase == "y"
    }
}

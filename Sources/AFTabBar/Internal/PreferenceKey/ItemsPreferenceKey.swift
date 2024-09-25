//
//  ItemsPreferenceKey.swift
//
//
//  Created by Yusuf Gürel at AppForce on 25.09.2024.
//  Copyright © 2024 AppForce. All rights reserved.
//
//  ====================================================================================================================
//

import SwiftUI

struct ItemsPreferenceKey<Selection: Hashable>: PreferenceKey {
    static var defaultValue: [Selection] { [] }

    static func reduce(value: inout [Selection], nextValue: () -> [Selection]) {
        value.append(contentsOf: nextValue())
    }
}

//
//  ItemSelectionHashValueEnvironmentKey.swift
//
//
//  Created by AppForce on 25.09.2024.
//  Copyright © 2024 AppForce. All rights reserved.
//
//  ====================================================================================================================
//

import SwiftUI

struct ItemSelectionHashValueEnvironmentKey: EnvironmentKey {
    static var defaultValue: Int? { nil }
}

extension EnvironmentValues {
    var tabItemSelectionHashValue: Int? {
        get { self[ItemSelectionHashValueEnvironmentKey.self] }
        set { self[ItemSelectionHashValueEnvironmentKey.self] = newValue }
    }
}

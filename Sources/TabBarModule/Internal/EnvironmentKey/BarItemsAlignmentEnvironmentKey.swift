//
//  BarItemsAlignmentEnvironmentKey.swift
//
//
//  Created by AppForce on 25.09.2024.
//  Copyright © 2024 AppForce. All rights reserved.
//
//  ====================================================================================================================
//

import SwiftUI

struct BarItemsAlignmentEnvironmentKey: EnvironmentKey {
    static var defaultValue: VerticalAlignment { .center }
}

extension EnvironmentValues {
    var tabBarItemsAlignment: VerticalAlignment {
        get { self[BarItemsAlignmentEnvironmentKey.self] }
        set { self[BarItemsAlignmentEnvironmentKey.self] = newValue }
    }
}

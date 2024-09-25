//
//  BarAnimationBuilderEnvironmentKey.swift
//
//
//  Created by AppForce on 25.09.2024.
//  Copyright © 2024 AppForce. All rights reserved.
//
//  ====================================================================================================================
//

import SwiftUI

struct BarAnimationBuilderEnvironmentKey: EnvironmentKey {
    static var defaultValue: (Bool) -> Animation? { { _ in .none } }
}

extension EnvironmentValues {
    var tabBarAnimationBuilder: (Bool) -> Animation? {
        get { self[BarAnimationBuilderEnvironmentKey.self] }
        set { self[BarAnimationBuilderEnvironmentKey.self] = newValue }
    }
}

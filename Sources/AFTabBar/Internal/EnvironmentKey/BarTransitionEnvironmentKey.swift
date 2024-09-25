//
//  BarTransitionEnvironmentKey.swift
//
//
//  Created by AppForce on 25.09.2024.
//  Copyright © 2024 AppForce. All rights reserved.
//
//  ====================================================================================================================
//

import SwiftUI

struct BarTransitionEnvironmentKey: EnvironmentKey {
    static var defaultValue: AnyTransition { .identity }
}

extension EnvironmentValues {
    var tabBarTransition: AnyTransition {
        get { self[BarTransitionEnvironmentKey.self] }
        set { self[BarTransitionEnvironmentKey.self] = newValue }
    }
}

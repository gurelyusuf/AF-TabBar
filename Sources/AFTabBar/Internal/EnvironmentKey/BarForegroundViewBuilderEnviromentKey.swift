//
//  BarForegroundViewBuilderEnviromentKey.swift
//
//
//  Created by AppForce on 25.09.2024.
//  Copyright © 2024 AppForce. All rights reserved.
//
//  ====================================================================================================================
//

import SwiftUI

struct BarForegroundViewBuilderEnviromentKey: EnvironmentKey {
    static var defaultValue: (() -> AnyView)? { nil }
}

extension EnvironmentValues {
    var tabBarForegroundViewBuilder: (() -> AnyView)? {
        get { self[BarForegroundViewBuilderEnviromentKey.self] }
        set { self[BarForegroundViewBuilderEnviromentKey.self] = newValue }
    }
}

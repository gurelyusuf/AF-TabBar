//
//  BarShapeEnvironmentKey.swift
//
//
//  Created by Yusuf Gürel at AppForce on 25.09.2024.
//  Copyright © 2024 AppForce. All rights reserved.
//
//  ====================================================================================================================
//

import SwiftUI

struct BarShapeEnvironmentKey: EnvironmentKey {
    static var defaultValue: (any Shape)? { nil }
}

extension EnvironmentValues {
    var tabBarShape: (any Shape)? {
        get { self[BarShapeEnvironmentKey.self] }
        set { self[BarShapeEnvironmentKey.self] = newValue }
    }
}

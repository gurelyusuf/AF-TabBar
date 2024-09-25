//
//  BarShapeStyleEnvironmentKey.swift
//
//
//  Created by Yusuf Gürel at AppForce on 25.09.2024.
//  Copyright © 2024 AppForce. All rights reserved.
//
//  ====================================================================================================================
//

import SwiftUI

struct BarShapeStyleEnvironmentKey: EnvironmentKey {
    static var defaultValue: AnyShapeStyle { .init(Material.bar) }
}

extension EnvironmentValues {
    var tabBarShapeStyle: AnyShapeStyle {
        get { self[BarShapeStyleEnvironmentKey.self] }
        set { self[BarShapeStyleEnvironmentKey.self] = newValue }
    }
}

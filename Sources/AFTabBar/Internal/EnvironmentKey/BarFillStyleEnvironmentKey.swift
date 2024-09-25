//
//  BarFillStyleEnvironmentKey.swift
//
//
//  Created by Yusuf Gürel at AppForce on 25.09.2024.
//  Copyright © 2024 AppForce. All rights reserved.
//
//  ====================================================================================================================
//

import SwiftUI

struct BarFillStyleEnvironmentKey: EnvironmentKey {
    static var defaultValue: FillStyle { .init() }
}

extension EnvironmentValues {
    var tabBarFillStyle: FillStyle {
        get { self[BarFillStyleEnvironmentKey.self] }
        set { self[BarFillStyleEnvironmentKey.self] = newValue }
    }
}

//
//  BarSpacingEnvironmentKey.swift
//
//
//  Created by Yusuf Gürel at AppForce on 25.09.2024.
//  Copyright © 2024 AppForce. All rights reserved.
//
//  ====================================================================================================================
//

import SwiftUI

struct BarSpacingEnvironmentKey: EnvironmentKey {
    static var defaultValue: CGFloat? { nil }
}

extension EnvironmentValues {
    var tabBarSpacing: CGFloat? {
        get { self[BarSpacingEnvironmentKey.self] }
        set { self[BarSpacingEnvironmentKey.self] = newValue }
    }
}

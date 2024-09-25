//
//  BarMarginsEnvironmentKey.swift
//
//
//  Created by Yusuf Gürel at AppForce on 25.09.2024.
//  Copyright © 2024 AppForce. All rights reserved.
//
//  ====================================================================================================================
//

import SwiftUI

struct BarMarginsEnvironmentKey: EnvironmentKey {
    static var defaultValue: EdgeInsets? { nil }
}

extension EnvironmentValues {
    var tabBarMargins: EdgeInsets? {
        get { self[BarMarginsEnvironmentKey.self] }
        set { self[BarMarginsEnvironmentKey.self] = newValue }
    }
}

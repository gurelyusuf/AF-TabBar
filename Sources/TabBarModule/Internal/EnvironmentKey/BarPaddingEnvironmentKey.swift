//
//  BarPaddingEnvironmentKey.swift
//
//
//  Created by Yusuf Gürel at AppForce on 25.09.2024.
//  Copyright © 2024 AppForce. All rights reserved.
//
//  ====================================================================================================================
//

import SwiftUI

struct BarPaddingEnvironmentKey: EnvironmentKey {
    static var defaultValue: EdgeInsets? { nil }
}

extension EnvironmentValues {
    var tabBarPadding: EdgeInsets? {
        get { self[BarPaddingEnvironmentKey.self] }
        set { self[BarPaddingEnvironmentKey.self] = newValue }
    }
}

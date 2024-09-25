//
//  SizeMesurementViewModifier.swift
//
//
//  Created by Yusuf Gürel at AppForce on 25.09.2024.
//  Copyright © 2024 AppForce. All rights reserved.
//
//  ====================================================================================================================
//

import SwiftUI

struct SizeMesurementViewModifier<Key: PreferenceKey>: ViewModifier where Key.Value == CGFloat {
    let path: KeyPath<CGSize, CGFloat>
    let key: Key.Type

    func body(content: Content) -> some View {
        content
            .background {
                GeometryReader { geo in
                    Color.clear.preference(key: key, value: geo.size[keyPath: path])
                }
            }
    }
}

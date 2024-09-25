//
//  InternalView+Extension.swift
//
//
//  Created by Yusuf Gürel at AppForce on 25.09.2024.
//  Copyright © 2024 AppForce. All rights reserved.
//
//  ====================================================================================================================
//

import SwiftUI

extension View {
    @ViewBuilder
    func `if`<V: View>(_ predicate: @autoclosure () -> Bool, modifier: @escaping (Self) -> V) -> some View {
        if predicate() {
            modifier(self)
        } else {
            self
        }
    }

    func measurementSize<Key: PreferenceKey>(
        of path: KeyPath<CGSize, CGFloat>,
        to key: Key.Type
    ) -> some View where Key.Value == CGFloat {
        modifier(SizeMesurementViewModifier(path: path, key: key))
    }

    func foreground<V: View>(_ content: @escaping () -> V) -> some View {
        self
            .foregroundStyle(.clear)
            .overlay {
                GeometryReader { geo in
                    content()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                        .mask { self }
                }
            }
    }
}

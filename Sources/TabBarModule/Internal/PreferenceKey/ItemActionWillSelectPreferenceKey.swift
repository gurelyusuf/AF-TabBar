//
//  ItemActionWillSelectPreferenceKey.swift
//
//
//  Created by Yusuf Gürel at AppForce on 25.09.2024.
//  Copyright © 2024 AppForce. All rights reserved.
//
//  ====================================================================================================================
//

import SwiftUI

struct ItemActionWillSelectPreferenceKey<Selection: Hashable>: PreferenceKey {
    static var defaultValue: [Selection: TabItemAction<Selection>] { [:] }

    static func reduce(
        value: inout [Selection: TabItemAction<Selection>],
        nextValue: () -> [Selection: TabItemAction<Selection>]
    ) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}

struct TabItemAction<Selection: Hashable>: Hashable, Equatable {
    let selectedItemHashValue: Int?
    let item: Selection
    let actionWillSelect: ActionWillSelect?

    func hash(into hasher: inout Hasher) {
        hasher.combine(selectedItemHashValue)
        hasher.combine(item)
    }

    static func == (lhs: TabItemAction, rhs: TabItemAction) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}

//
//  ScrollToTopSubject.swift
//  swiftui-tab-bar
//
//  Created by AppForce on 25.09.2024.
//  Copyright © 2024 AppForce. All rights reserved.
//

import SwiftUI
import Combine

public class ScrollToTopSubject: ObservableObject {
    public let publisher = PassthroughSubject<Any, Never>()
    
    public init() {}
    
    public func send(_ value: Any) {
        publisher.send(value)
    }
}

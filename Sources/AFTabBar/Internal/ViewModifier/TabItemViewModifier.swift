//
//  TabItemViewModifier.swift
//
//
//  Created by Yusuf Gürel at AppForce on 25.09.2024.
//  Copyright © 2024 AppForce. All rights reserved.
//
//  ====================================================================================================================
//

import SwiftUI
import Combine

struct TabItemViewModifier<Selection: Hashable, V: View>: ViewModifier {
    @Environment(\.tabItemSelectionHashValue) private var selectionHashValue
    @EnvironmentObject private var scrollToTopSubject: ScrollToTopSubject
    private let item: Selection
    @ViewBuilder private let itemBuilder: () -> V
    private let actionWillSelect: ActionWillSelect?
    @State private var cancellable: AnyCancellable?

    init(item: Selection, @ViewBuilder itemBuilder: @escaping () -> V, willSelect action: ActionWillSelect?) {
        self.item = item
        self.itemBuilder = itemBuilder
        self.actionWillSelect = action
    }

    func body(content: Content) -> some View {
        content
            .opacity(selectionHashValue == item.hashValue ? 1 : 0)
            .disabled(!(selectionHashValue == item.hashValue))
            .preference(key: ItemsPreferenceKey.self, value: [item])
            .preference(
                key: ItemViewBuilderPreferenceKey.self,
                value: [
                    item: AnyItemViewBuilder(
                        selectedItemHashValue: selectionHashValue,
                        item: item,
                        content: { AnyView(VStack(spacing: 0, content: itemBuilder)) }
                    )
                ]
            )
            .preference(
                key: ItemActionWillSelectPreferenceKey.self,
                value: [
                    item: TabItemAction(
                        selectedItemHashValue: selectionHashValue,
                        item: item,
                        actionWillSelect: actionWillSelect
                    )
                ]
            )
            .onAppear {
                cancellable = scrollToTopSubject.publisher
                    .filter { $0 as? Selection == item }
                    .sink { _ in
                        DispatchQueue.main.async {
                            self.scrollToTop()
                        }
                    }
            }
    }

    private func scrollToTop() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first,
              let rootViewController = window.rootViewController else {
            return
        }

        if let navigationController = findNavigationController(in: rootViewController) {
            if navigationController.viewControllers.count > 1 {
                navigationController.popToRootViewController(animated: true)
            } else {
                scrollToTopInView(navigationController.view)
            }
        } else {
            scrollToTopInView(rootViewController.view)
        }
    }

    private func findNavigationController(in viewController: UIViewController) -> UINavigationController? {
        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }

        for child in viewController.children {
            if let navigationController = findNavigationController(in: child) {
                return navigationController
            }
        }

        return nil
    }

    private func scrollToTopInView(_ view: UIView) {
        if let scrollView = findScrollView(in: view) {
            scrollView.setContentOffset(.zero, animated: true)
        }
    }

    private func findScrollView(in view: UIView) -> UIScrollView? {
        if let scrollView = view as? UIScrollView {
            return scrollView
        }

        for subview in view.subviews {
            if let scrollView = findScrollView(in: subview) {
                return scrollView
            }
        }

        return nil
    }
}

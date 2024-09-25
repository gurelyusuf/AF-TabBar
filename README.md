# AFTabBar

<p align="left">
<a href="https://www.swift.org"><img src="https://img.shields.io/badge/Language-Swift%205.5-%23DE5D43"></a>
<a href="https://developer.apple.com/ios/"><img src="https://img.shields.io/badge/Platform-iOS%2015.0%2B-%2359ABE1"></a>
<a href="https://developer.apple.com/documentation/SwiftUI"><img src="https://img.shields.io/badge/Framework-SwiftUI-%233B82F7"></a>
<a href="https://www.swift.org/package-manager/"><img src="https://img.shields.io/badge/SPM-Compatible-%23FF149367"></a>
<a href="https://en.wikipedia.org/wiki/MIT_License/"><img src="https://img.shields.io/badge/license-mit-brightgreen.svg"></a>
</p>

**`AFTabBar`** is a fully customizable SwiftUI tab bar component, designed to work like [`TabView`](https://developer.apple.com/documentation/swiftui/tabview).

## Installation

#### Swift Package Manager

Add the following line to the dependencies in `Package.swift`, to use the `AFTabBar` in a SPM project:

```swift
.package(url: "https://github.com/gurelyusuf/AF-TabBar", from: "0.0.1"),
```

Add `import AFTabBar` into your source code to use `TabBar`.

#### Xcode

Go to `File > Add Package Dependencies...` and paste the repo's URL:

```
https://github.com/gurelyusuf/AF-TabBar.git
```

#

## Usage

Like `TabView`, the `TabBar` takes a Binding value that conforms to `Hashable`.

```swift
import SwiftUI
import AFTabBar

struct ContentView: View {
    @State private var item: Int = 0

    var body: some View {
        TabBar(selection: $item) {
            HomeView()
                .tabItem(0) {
                    Image(systemName: item == 0 ? "house.fill" : "house")
                        .font(.title3)
                    Text("Home")
                        .font(.system(.footnote, design: .rounded).weight(item == 0 ? .bold : .medium))
                }
            MarksView()
                .tabItem(1) { /* ... */ }
            UserView()
                .tabItem(2) { /* ... */ }
        }
    }
}
```

The `TabBar` offers a default style if no modifiers are applied.

Using modifiers, you can easily customize the `TabBar`'s appearance.

```swift
TabBar(selection: $item) {
    // ...
}
.tabBarFill(.regularMaterial)
.tabBarMargins(.vertical, 8)
.tabBarPadding(.vertical, 8)
.tabBarPadding(.horizontal, 16)
.tabBarShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
.tabBarShadow(radius: 1, y: 1)
```

### Shape and Fill Style

- The `TabBar` supports any background shape that conforms to the `Shape` protocol, such as a `Capsule`.

```swift
TabBar(selection: $item) { /* ... */ }
    .tabBarPadding(.vertical, 8)
    .tabBarPadding(.horizontal, 16)
    .tabBarShape(Capsule(style: .continuous))
    .tabBarFill(.linearGradient(
        colors: [.yellow, .yellow.opacity(0.4)],
        startPoint: .top, endPoint: .bottom))
```

---

- The `TabBar` allows any fill that conforms to the `ShapeStyle` protocol.

```swift
TabBar(selection: $item) { /* ... */ }
    .tabBarFill(.linearGradient(
        colors: [.orange, .yellow], startPoint: .top, endPoint: .bottom))
```

---

- In addition to using `ShapeStyle` for filling, you can also use any view to customize the foreground of the `TabBar`.

```swift
TabBar(selection: $item) { /* ... */ }
    .tabBarForeground {
        Image("BarOrange").resizable().scaledToFill()
    }
    .tabBarShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    .tabBarShadow(radius: 1, y: 2)
```

### Visibility with Animation and Transition

The `TabBar` accepts a Binding value of type `Visibility` to manage its visibility. When set to `.automatic`, the `TabBar` will monitor the keyboard's appearance to show or hide itself accordingly.

Additionally, you can customize the animation and transition for the `TabBar`'s appearance and disappearance.

```swift
TabBar(selection: $item, visibility: $visibility) { /* ... */ }
    .tabBarTransition(.move(edge: .bottom).combined(with: .opacity))
    .tabBarAnimation { isTabBarVisible in
        isTabBarVisible ? .easeInOut : .linear
    }
```

© 2024 Yusuf Gürel • [AppForce](https://appforce.co). All rights reserved.

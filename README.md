URLBlueprints is a multiplatform tool for deeplinks handling & routing. It allows to define and register blueprints that acts as pattern for deeplink matching.

## Requirements

### Development
Project uses following tools for development
1. [XCodeGen](https://github.com/yonaskolb/XcodeGen)
2. [Cocoapods](https://cocoapods.org)
3. [SwiftLint](https://github.com/realm/SwiftLint)

## Installation

To get started with the **URLBlueprints** you first have to decide how you will integrate it with your project. URLBlueprints supports following tools:

### Cocoapods

To install URLBlueprints using Cocoapods go through following steps:

1. Add the following entry in your **Podfile**:
```
pod 'URLBlueprints'
```
2. Then run `pod install`.


### Carthage

To install URLBlueprints using Carthage go through following steps:

1. Add the following entry to your **Cartfile**

```
github "lewandowskit93/URLBlueprints"
```

2. Then run ```carthage update```

### Swift Package Manager

To install URLBlueprints using **Swift Package Manager** go through following steps:

1. Add following package dependency in you **Package.swift** ``` .package(url: "https://github.com/lewandowskit93/URLBlueprints.git", from: "0.0.2") ```
2. Add following target dependency in your **Package.swift** ``` dependencies: ["URLBlueprints"]) ```

For instance this is how it might look like:
```swift
import PackageDescription

let package = Package(
    name: "YourLibrary",
    products: [
        .library(
            name: "YourLibrary",
            targets: ["YourLibrary"])
    ],
    dependencies: [
        .package(url: "https://github.com/lewandowskit93/URLBlueprints.git", from: "0.0.2")
    ],
    targets: [
        .target(
            name: "YourLibrary",
            dependencies: ["URLBlueprints"])
    ]
)
```

## Overview

Here is a quick overview of functionalities and concepts used in **URLBlueprints**.

## Example

For more detailed example please see the source code.

## Contribution

Project is created and maintained by **Tomasz Lewandowski**.

If you created some new feature or fixed a bug you can create a pull request. Please feel free to submit your feature requests if you have any.

## License

URLBlueprints is released under an MIT license. See [License.md](LICENSE.md) for more information.

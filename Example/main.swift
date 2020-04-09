//
//  main.swift
//  Example
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Foundation
import DeeplinkBlueprints

let router = DeeplinkRouter<ExampleDeeplink>()

private func debugRoute(url: URL, router: DeeplinkRouter<ExampleDeeplink>) {
    print("~~~~~~~~~~~~~~~~~~~~~~~")
    print(url)
    print("Can handle: \(router.canHandleURL(url: url))")
    print("Route: \(router.route(forUrl: url))")
}

let b1 = ExampleDeeplinkBlueprints.simple1.blueprint
print("Registering \(b1.pattern)")
router.register(blueprint: b1, routeProvider: { deeplink in
    try? print("Handling \(deeplink.urlString())")
    return .blank
})

let b2 = ExampleDeeplinkBlueprints.simple2.blueprint
print("Registering \(b2.pattern)")
router.register(blueprint: b2) { deeplink in
    try? print("Handling \(deeplink.urlString())")
    return .redirect(toURL: URL(string: "www.google.com")!)
}

let b3 = ExampleDeeplinkBlueprints.complex1(userId: .intPlaceholder(key: "userId")).blueprint
print("Registering \(b3.pattern)")
router.register(blueprint: b3, routeProvider: { deeplink in
    try? print("Handling \(deeplink.urlString())")
    guard case let .n3(_, _, .int(userId)) = Counted(deeplink.components) else { return .blank }
    return .handleDeeplink(deeplink: .complex1(userId: userId))
})

let b4 = ExampleDeeplinkBlueprints.complex2(userId: .intPlaceholder(key: "userId"), itemId: .stringPlaceholder(key: "itemId") ).blueprint
print("Registering \(b4.pattern)")
router.register(blueprint: b4, routeProvider: { deeplink in
    try? print("Handling \(deeplink.urlString())")
    return .blank
})

debugRoute(url: URL(string: "http://www.google.com")!, router: router)
debugRoute(url: URL(string: "example://simple/index.html")!, router: router)
debugRoute(url: URL(string: "example://simple/resource.html")!, router: router)
debugRoute(url: URL(string: "example://complex/user/123")!, router: router)
debugRoute(url: URL(string: "example://complex/user/123d")!, router: router)
debugRoute(url: URL(string: "example://complex/user/123/items/item_1/anything")!, router: router)

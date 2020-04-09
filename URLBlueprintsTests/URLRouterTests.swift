//
//  URLRouterTests.swift
//  URLBlueprints
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Foundation
import XCTest
@testable import URLBlueprints

class URLRouterTests: XCTestCase {
    enum DeeplinkBlueprints {
        case simple
        case user(id: URLBlueprintComponent)
        case item(id: URLBlueprintComponent)
        
        var blueprint: URLBlueprint {
            return URLBlueprint(
                scheme: scheme,
                components: components)
        }
        
        var scheme: String {
            return "scheme"
        }
        
        private var components: [URLBlueprintComponent] {
            switch self {
            case .simple: return [.constant("index.html")]
            case .user(let id):
                return [.constant("user"), id]
            case .item(let id):
                return [.constant("item"), id]
            }
        }
    }
    enum Deeplink {
        case simple
        case user(id: Int)
        case item(id: String)
        
        var blueprint: DeeplinkBlueprints {
            switch self {
            case .simple: return .simple
            case .user(let id): return .user(id: .int(id))
            case .item(let id): return .item(id: .string(id))
            }
        }
    }
    
    var sut: URLRouter<Deeplink>!
    
    override func setUp() {
        super.setUp()
        sut = URLRouter<Deeplink>()
        sut.register(
            blueprint: DeeplinkBlueprints.simple.blueprint,
            routeProvider: { _ in return Route<Deeplink>.blank })
        sut.register(
            blueprint: DeeplinkBlueprints.user(id: .intPlaceholder(key: "user_id")).blueprint,
            routeProvider: { _ in return Route<Deeplink>.blank })
    }
    
    func testCanHandleURL_WhenCalledForRegisteredURL_ShouldReturnTrue() {
        XCTAssertTrue(sut.canHandleURL(url: try! Deeplink.simple.blueprint.blueprint.url()!))
        XCTAssertTrue(sut.canHandleURL(url: try! Deeplink.user(id: 123).blueprint.blueprint.url()!))
    }
    
    func testCanHandleURL_WhenCalledForNonRegisteredURL_ShouldReturnFalse() {
        XCTAssertFalse(sut.canHandleURL(url: try! Deeplink.item(id: "abc").blueprint.blueprint.url()!))
    }
    
    func testCanHandleURL_WhenCalledForInvalidURL_ShouldReturnFalse() {
        XCTAssertFalse(sut.canHandleURL(url: URL(string: "scheme://user/invalid_id")!))
    }
}

//
//  DeeplinkBlueprintComponentTests.swift
//  DeeplinkBlueprints
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Foundation
import XCTest
import DeeplinkBlueprints

class DeeplinkBlueprintComponentTests: XCTestCase {
    func testPatterns() {
        XCTAssertEqual("constant", DeeplinkBlueprintComponent.constant("constant").pattern)
        XCTAssertEqual("other_constant", DeeplinkBlueprintComponent.constant("other_constant").pattern)
        XCTAssertEqual("*", DeeplinkBlueprintComponent.wildcard.pattern)
        XCTAssertEqual("<int:name>", DeeplinkBlueprintComponent.intPlaceholder(key: "name").pattern)
        XCTAssertEqual("<int:name1>", DeeplinkBlueprintComponent.intPlaceholder(key: "name1").pattern)
        XCTAssertEqual("<float:name>", DeeplinkBlueprintComponent.floatPlaceholder(key: "name").pattern)
        XCTAssertEqual("<float:name1>", DeeplinkBlueprintComponent.floatPlaceholder(key: "name1").pattern)
        XCTAssertEqual("<string:name>", DeeplinkBlueprintComponent.stringPlaceholder(key: "name").pattern)
        XCTAssertEqual("<string:name1>", DeeplinkBlueprintComponent.stringPlaceholder(key: "name1").pattern)
        XCTAssertEqual("123", DeeplinkBlueprintComponent.int(123).pattern)
        XCTAssertEqual("1234", DeeplinkBlueprintComponent.int(1234).pattern)
        XCTAssertEqual("123.0", DeeplinkBlueprintComponent.float(123.0).pattern)
        XCTAssertEqual("123.5", DeeplinkBlueprintComponent.float(123.5).pattern)
        XCTAssertEqual("value", DeeplinkBlueprintComponent.string("value").pattern)
        XCTAssertEqual("value1", DeeplinkBlueprintComponent.string("value1").pattern)
    }
}

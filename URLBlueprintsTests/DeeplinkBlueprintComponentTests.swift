//
//  URLBlueprintComponentTests.swift
//  URLBlueprints
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Foundation
import XCTest
import URLBlueprints

class URLBlueprintComponentTests: XCTestCase {
    func testPatterns() {
        XCTAssertEqual("constant", URLBlueprintComponent.constant("constant").pattern)
        XCTAssertEqual("other_constant", URLBlueprintComponent.constant("other_constant").pattern)
        XCTAssertEqual("*", URLBlueprintComponent.wildcard.pattern)
        XCTAssertEqual("<int:name>", URLBlueprintComponent.intPlaceholder(key: "name").pattern)
        XCTAssertEqual("<int:name1>", URLBlueprintComponent.intPlaceholder(key: "name1").pattern)
        XCTAssertEqual("<float:name>", URLBlueprintComponent.floatPlaceholder(key: "name").pattern)
        XCTAssertEqual("<float:name1>", URLBlueprintComponent.floatPlaceholder(key: "name1").pattern)
        XCTAssertEqual("<string:name>", URLBlueprintComponent.stringPlaceholder(key: "name").pattern)
        XCTAssertEqual("<string:name1>", URLBlueprintComponent.stringPlaceholder(key: "name1").pattern)
        XCTAssertEqual("123", URLBlueprintComponent.int(123).pattern)
        XCTAssertEqual("1234", URLBlueprintComponent.int(1234).pattern)
        XCTAssertEqual("123.0", URLBlueprintComponent.float(123.0).pattern)
        XCTAssertEqual("123.5", URLBlueprintComponent.float(123.5).pattern)
        XCTAssertEqual("value", URLBlueprintComponent.string("value").pattern)
        XCTAssertEqual("value1", URLBlueprintComponent.string("value1").pattern)
    }
}

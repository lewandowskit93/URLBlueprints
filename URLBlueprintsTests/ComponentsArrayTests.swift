//
//  ComponentsArrayTests.swift
//  URLBlueprints
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Foundation
import XCTest
@testable import URLBlueprints

class ComponentsArrayTests: XCTestCase {
    func testMatch_WhenAllComponentsMatch_ShouldMatch() {
        XCTAssertMatch([URLBlueprintComponent.wildcard, .wildcard, .wildcard], ["123", "456.5", "string"])
    }
    
    func testMatch_WhenOneValueDoesntMatch_ShouldNotMatch() {
        XCTAssertNotMatch([URLBlueprintComponent.constant("val"), .wildcard, .wildcard], ["123", "456.5", "string"])
        XCTAssertNotMatch([URLBlueprintComponent.wildcard, .constant("val"), .wildcard], ["123", "456.5", "string"])
        XCTAssertNotMatch([URLBlueprintComponent.wildcard, .wildcard, .constant("val")], ["123", "456.5", "string"])
    }
    
    func testExtract_WhenAllComponentsMatch_ShouldExtractComponents() throws {
        try XCTAssertEqual(
            [URLBlueprintComponent.int(123), .float(456.5), .string("string")],
            [.intPlaceholder(key: "val"), .floatPlaceholder(key: "val"), .stringPlaceholder(key: "val")] <~ ["123", "456.5", "string"])
    }
    
    func testExtract_WhenSingleComponentDoesntMatch_ShouldThrowError() {
        XCTAssertThrowsError(try [
            .intPlaceholder(key: "id"),
            .floatPlaceholder(key: "val"),
            .stringPlaceholder(key: "val")] <~ ["username", "456.5", "string"],
                             "Invalid component type") { (error) in
            XCTAssertEqual(URLBlueprintError.invalidValueType(expected: .intPlaceholder(key: "id"), actual: "username"), error as? URLBlueprintError)
        }
    }
    
    func testExtract_WhenComponentCountDiffers_ShouldThrowError() {
        XCTAssertThrowsError(try [
            .floatPlaceholder(key: "val"),
            .stringPlaceholder(key: "val")] <~ ["username", "456.5", "string"],
                             "Invalid component type") { (error) in
                                XCTAssertEqual(URLBlueprintError.invalidComponentCount(expected: 2, actual: 3), error as? URLBlueprintError)
        }
    }
}

private func XCTAssertMatch(_ components: [URLBlueprintComponent], _ values: [String]) {
    XCTAssertTrue(components ~= values)
}


private func XCTAssertNotMatch(_ components: [URLBlueprintComponent], _ values: [String]) {
    XCTAssertFalse(components ~= values)
}

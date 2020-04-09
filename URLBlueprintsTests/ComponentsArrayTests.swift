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
}

private func XCTAssertMatch(_ components: [URLBlueprintComponent], _ values: [String]) {
    XCTAssertTrue(components ~= values)
}


private func XCTAssertNotMatch(_ components: [URLBlueprintComponent], _ values: [String]) {
    XCTAssertFalse(components ~= values)
}

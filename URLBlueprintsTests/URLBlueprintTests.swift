//
//  URLBlueprintTests.swift
//  URLBlueprints
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Foundation
import XCTest
@testable import URLBlueprints

class URLBlueprintTests: XCTestCase {
    func testMatch_WhenSchemeAndComponentsMatch_ShouldMatch() {
       let blueprint = URLBlueprint(scheme: "scheme", components: [.intPlaceholder(key: "name")])
       let url = URL(string: "scheme://123")!
       XCTAssertMatch(blueprint, url)
    }
    func testMatch_WhenSchemeDoesntMatch_ShouldNotMatch() {
        let blueprint = URLBlueprint(scheme: "scheme", components: [])
        let url = URL(string: "other_scheme://")!
        XCTAssertNotMatch(blueprint, url)
    }
    
    func testMatch_WhenSchemeMatchButComponentsDoesnt_ShouldNotMatch() {
        let blueprint = URLBlueprint(scheme: "scheme", components: [.intPlaceholder(key: "name")])
        let url = URL(string: "scheme://string")!
        XCTAssertNotMatch(blueprint, url)
    }
    
    func testPattern_WhenCalled_ShouldReturnCorrectPattern() {
        XCTAssertEqual("scheme://<string:name>", URLBlueprint(scheme: "scheme", components: [.stringPlaceholder(key: "name")]).pattern)
    }
    
    func testUrlString_WhenCalled_ShouldReturnCorrectUrlString() throws {
        try XCTAssertEqual("scheme://string", URLBlueprint(scheme: "scheme", components: [.constant("string")]).urlString())
    }
    
    func testUrl_WhenCalled_ShouldReturnCorrectUrlString() throws {
        try XCTAssertEqual(URL(string: "scheme://string")!, URLBlueprint(scheme: "scheme", components: [.constant("string")]).url())
    }
}

private func XCTAssertMatch(_ blueprint: URLBlueprint, _ url: URL) {
    XCTAssertTrue(blueprint ~= url)
}


private func XCTAssertNotMatch(_ blueprint: URLBlueprint, _ url: URL) {
    XCTAssertFalse(blueprint ~= url)
}

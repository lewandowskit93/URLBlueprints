//
//  URLBlueprintComponentTests.swift
//  URLBlueprints
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Foundation
import XCTest
@testable import URLBlueprints

class URLBlueprintComponentTests: XCTestCase {
    func testPatterns_WhenCalled_ShouldReturnCorrectPattern() {
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
    
    func testPathComponents_WhenCalledOnValues_ShouldReturnComponent() throws {
        try XCTAssertEqual("constant", URLBlueprintComponent.constant("constant").pathComponent())
        try XCTAssertEqual("123", URLBlueprintComponent.int(123).pathComponent())
        try XCTAssertEqual("123.5", URLBlueprintComponent.float(123.5).pathComponent())
        try XCTAssertEqual("value", URLBlueprintComponent.string("value").pathComponent())
    }
    
    func testPathComponents_WhenCalledOnPlaceholder_ShouldThrowError() {
        XCTAssertThrowsError(try URLBlueprintComponent.wildcard.pathComponent(), "Wildcard") { (error) in
            XCTAssertTrue(URLBlueprintError.placeholdersInBlueprint == (error as? URLBlueprintError))
        }
        XCTAssertThrowsError(try URLBlueprintComponent.intPlaceholder(key: "name").pathComponent(), "Int") { (error) in
            XCTAssertTrue(URLBlueprintError.placeholdersInBlueprint == (error as? URLBlueprintError))
        }
        XCTAssertThrowsError(try URLBlueprintComponent.floatPlaceholder(key: "name").pathComponent(), "Float") { (error) in
            XCTAssertTrue(URLBlueprintError.placeholdersInBlueprint == (error as? URLBlueprintError))
        }
        XCTAssertThrowsError(try URLBlueprintComponent.stringPlaceholder(key: "name").pathComponent(), "String") { (error) in
            XCTAssertTrue(URLBlueprintError.placeholdersInBlueprint == (error as? URLBlueprintError))
        }
    }
    
    func testWildcardMatch_WhenMatchingWithAnyArgument_ShouldReturnTrue() {
        XCTAssertMatch(URLBlueprintComponent.wildcard, "value")
        XCTAssertMatch(URLBlueprintComponent.wildcard, "value1")
        XCTAssertMatch(URLBlueprintComponent.wildcard, "123")
        XCTAssertMatch(URLBlueprintComponent.wildcard, "123.5")
    }
    
    func testConstantMatch_WhenCalledWithSameConstant_ShouldMach() {
        XCTAssertMatch(URLBlueprintComponent.constant("value"), "value")
        XCTAssertMatch(URLBlueprintComponent.constant("value1"), "value1")
    }
    
    func testConstantMatch_WhenCalledWithDifferentConstant_ShouldNotMach() {
        XCTAssertNotMatch(URLBlueprintComponent.constant("value"), "value1")
        XCTAssertNotMatch(URLBlueprintComponent.constant("value1"), "value")
    }
    
    func testIntMatch_WhenCalledWithAnyInteger_ShouldMatch() {
        XCTAssertMatch(URLBlueprintComponent.int(123), "1")
        XCTAssertMatch(URLBlueprintComponent.int(123), "123")
    }
    
    func testIntMatch_WhenCalledWithNonInteger_ShouldNotMatch() {
        XCTAssertNotMatch(URLBlueprintComponent.int(123), "string")
        XCTAssertNotMatch(URLBlueprintComponent.int(123), "123.5")
    }
    
    func testIntPlaceholderMatch_WhenCalledWithAnyInteger_ShouldMatch() {
        XCTAssertMatch(URLBlueprintComponent.intPlaceholder(key: "name"), "1")
        XCTAssertMatch(URLBlueprintComponent.intPlaceholder(key: "name"), "123")
    }
    
    func testIntPlaceholderMatch_WhenCalledWithNonInteger_ShouldNotMatch() {
        XCTAssertNotMatch(URLBlueprintComponent.intPlaceholder(key: "name"), "string")
        XCTAssertNotMatch(URLBlueprintComponent.intPlaceholder(key: "name"), "123.5")
    }
    
    func testFloatMatch_WhenCalledWithAnyNumeric_ShouldMatch() {
        XCTAssertMatch(URLBlueprintComponent.float(123), "1")
        XCTAssertMatch(URLBlueprintComponent.float(123), "123.5")
    }
    
    func testFloatMatch_WhenCalledWithString_ShouldNotMatch() {
        XCTAssertNotMatch(URLBlueprintComponent.float(123), "string")
    }
    
    func testFloatPlaceholderMatch_WhenCalledWithAnyNumeric_ShouldMatch() {
        XCTAssertMatch(URLBlueprintComponent.floatPlaceholder(key: "name"), "1")
        XCTAssertMatch(URLBlueprintComponent.floatPlaceholder(key: "name"), "123.5")
    }
    
    func testFloatPlaceholderMatch_WhenCalledWithString_ShouldNotMatch() {
        XCTAssertNotMatch(URLBlueprintComponent.floatPlaceholder(key: "name"), "string")
    }
    
    func testStringMatch_WhenCalledWithAnyValue_ShouldMatch() {
        XCTAssertMatch(URLBlueprintComponent.string("123"), "1")
        XCTAssertMatch(URLBlueprintComponent.string("123"), "123.5")
        XCTAssertMatch(URLBlueprintComponent.string("123"), "string")
    }
    
    func testStringPlaceholderMatch_WhenCalledWithAnyValue_ShouldMatch() {
        XCTAssertMatch(URLBlueprintComponent.stringPlaceholder(key: "name"), "1")
        XCTAssertMatch(URLBlueprintComponent.stringPlaceholder(key: "name"), "123.5")
        XCTAssertMatch(URLBlueprintComponent.stringPlaceholder(key: "name"), "string")
    }
    
    func testExtractWildcard_WhenCalledWithAnyValue_ShouldReturnWildcard() throws {
        try XCTAssertEqual(.wildcard, (URLBlueprintComponent.wildcard <~ "value"))
        try XCTAssertEqual(.wildcard, (URLBlueprintComponent.wildcard <~ "123"))
        try XCTAssertEqual(.wildcard, (URLBlueprintComponent.wildcard <~ "123.5"))
    }
    
    func testExtractConstant_WhenCalledWithAnyValue_ShouldReturnThatConstant() throws {
        try XCTAssertEqual(.constant("val"), (URLBlueprintComponent.constant("val") <~ "value"))
        try XCTAssertEqual(.constant("val2"), (URLBlueprintComponent.constant("val2") <~ "123"))
        try XCTAssertEqual(.constant("val3"), (URLBlueprintComponent.constant("val3") <~ "123.5"))
    }
    
    func testExtractInt_WhenCalledWithInteger_ShouldOverrideAndExtractedInt() throws {
        try XCTAssertEqual(.int(123), (URLBlueprintComponent.int(10) <~ "123"))
        try XCTAssertEqual(.int(1234), (URLBlueprintComponent.int(10) <~ "1234"))
        try XCTAssertEqual(.int(1234), (URLBlueprintComponent.int(11) <~ "1234"))
    }
    
    func testExtractInt_WhenCalledWithNonInteger_ShouldThrowError() throws {
        XCTAssertThrowsError(try (URLBlueprintComponent.int(10) <~ "123.5")) { (error) in
            XCTAssertTrue(URLBlueprintError.invalidValueType(expected: .int(10), actual: "123.5") == (error as? URLBlueprintError))
        }
        XCTAssertThrowsError(try (URLBlueprintComponent.int(10) <~ "value")) { (error) in
            XCTAssertTrue(URLBlueprintError.invalidValueType(expected: .int(10), actual: "value") == (error as? URLBlueprintError))
        }
    }
    
    func testExtractIntFromPlaceholder_WhenCalledWithInteger_ShouldExtractInt() throws {
        try XCTAssertEqual(.int(123), (URLBlueprintComponent.intPlaceholder(key: "name") <~ "123"))
        try XCTAssertEqual(.int(1234), (URLBlueprintComponent.intPlaceholder(key: "name") <~ "1234"))
        try XCTAssertEqual(.int(1234), (URLBlueprintComponent.intPlaceholder(key: "name") <~ "1234"))
    }
    
    func testExtractIntFromPlaceholder_WhenCalledWithNonInteger_ShouldThrowError() throws {
        XCTAssertThrowsError(try (URLBlueprintComponent.intPlaceholder(key: "name") <~ "123.5")) { (error) in
            XCTAssertTrue(URLBlueprintError.invalidValueType(expected: .intPlaceholder(key: "name"), actual: "123.5") == (error as? URLBlueprintError))
        }
        XCTAssertThrowsError(try (URLBlueprintComponent.intPlaceholder(key: "name") <~ "value")) { (error) in
            XCTAssertTrue(URLBlueprintError.invalidValueType(expected: .intPlaceholder(key: "name"), actual: "value") == (error as? URLBlueprintError))
        }
    }
    
    func testExtractFloat_WhenCalledWithNumeric_ShouldOverrideAndExtractedInt() throws {
        try XCTAssertEqual(.float(123), (URLBlueprintComponent.float(10) <~ "123"))
        try XCTAssertEqual(.float(1234.5), (URLBlueprintComponent.float(10) <~ "1234.5"))
        try XCTAssertEqual(.float(1234.5), (URLBlueprintComponent.float(11) <~ "1234.5"))
    }

    func testExtractFloat_WhenCalledWithNonNumeric_ShouldThrowError() throws {
        XCTAssertThrowsError(try (URLBlueprintComponent.float(10.5) <~ "value")) { (error) in
            XCTAssertTrue(URLBlueprintError.invalidValueType(expected: .float(10.5), actual: "value") == (error as? URLBlueprintError))
        }
    }

    func testExtractFloatFromPlaceholder_WhenCalledWithNumeric_ShouldExtractInt() throws {
        try XCTAssertEqual(.float(123), (URLBlueprintComponent.floatPlaceholder(key: "name") <~ "123"))
        try XCTAssertEqual(.float(1234.5), (URLBlueprintComponent.floatPlaceholder(key: "name") <~ "1234.5"))
        try XCTAssertEqual(.float(1234.5), (URLBlueprintComponent.floatPlaceholder(key: "name") <~ "1234.5"))
    }

    func testExtractFloatFromPlaceholder_WhenCalledWithNonNumeric_ShouldThrowError() throws {
        XCTAssertThrowsError(try (URLBlueprintComponent.floatPlaceholder(key: "name") <~ "value")) { (error) in
            XCTAssertTrue(URLBlueprintError.invalidValueType(expected: .floatPlaceholder(key: "name"), actual: "value") == (error as? URLBlueprintError))
        }
    }
    
    func testExtractString_WhenCalledWithAnyValue_ShouldOverrideAndExtractThatValue() throws {
        try XCTAssertEqual(.string("value"), (URLBlueprintComponent.string("val") <~ "value"))
        try XCTAssertEqual(.string("123"), (URLBlueprintComponent.string("val2") <~ "123"))
        try XCTAssertEqual(.string("123.5"), (URLBlueprintComponent.string("val3") <~ "123.5"))
    }
    
    func testExtractStringFromPlaceholder_WhenCalledWithAnyValue_ShouldOverrideAndExtractThatValue() throws {
        try XCTAssertEqual(.string("value"), (URLBlueprintComponent.stringPlaceholder(key: "val") <~ "value"))
        try XCTAssertEqual(.string("123"), (URLBlueprintComponent.stringPlaceholder(key: "val2") <~ "123"))
        try XCTAssertEqual(.string("123.5"), (URLBlueprintComponent.stringPlaceholder(key: "val3") <~ "123.5"))
    }
}

private func XCTAssertMatch(_ component: URLBlueprintComponent, _ value: String) {
    XCTAssertTrue(component ~= value)
}


private func XCTAssertNotMatch(_ component: URLBlueprintComponent, _ value: String) {
    XCTAssertFalse(component ~= value)
}

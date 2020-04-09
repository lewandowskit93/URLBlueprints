//
//  DeeplinkBlueprintComponent.swift
//  DeeplinkBlueprints
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public enum DeeplinkBlueprintComponent: Hashable {
    case constant(String)
    case wildcard
    case intPlaceholder(key: String)
    case int(Int)
    case floatPlaceholder(key: String)
    case float(Float)
    case stringPlaceholder(key: String)
    case string(String)
    
    public var pattern: String {
        switch self {
        case .constant(let value): return value
        case .wildcard: return "*"
        case .intPlaceholder(let key): return "<int:\(key)>"
        case .floatPlaceholder(let key): return "<float:\(key)>"
        case .stringPlaceholder(let key): return "<string:\(key)>"
        case .int(let value): return "\(value)"
        case .float(let value): return "\(value)"
        case .string(let value): return "\(value)"
        }
    }
    
    public func pathComponent() throws -> String {
        switch self {
        case .constant(let value): return value
        case .wildcard,
             .intPlaceholder,
             .floatPlaceholder,
             .stringPlaceholder: throw DeeplinkBlueprintError.placeholdersInBlueprint
        case .int(let value): return "\(value)"
        case .float(let value): return "\(value)"
        case .string(let value): return "\(value)"
        }
    }
    
    public static func ~= (component: DeeplinkBlueprintComponent, pathComponent: String) -> Bool {
        switch component {
        case .wildcard: return true
        case .constant(let value): return value == pathComponent
        case .intPlaceholder, .int: return Int(pathComponent) != nil
        case .floatPlaceholder, .float: return Float(pathComponent) != nil
        case .stringPlaceholder, .string: return true
        }
    }
    
    public static func ~> (blueprintComponent: DeeplinkBlueprintComponent, pathComponent: String) throws -> DeeplinkBlueprintComponent {
        switch blueprintComponent {
        case .wildcard, .constant: return blueprintComponent
        case .intPlaceholder, .int:
            guard let int = Int(pathComponent) else { throw DeeplinkBlueprintError.invalidValueType(expected: blueprintComponent, actual: pathComponent) }
            return .int(int)
        case .floatPlaceholder, .float:
            guard let float = Float(pathComponent) else { throw DeeplinkBlueprintError.invalidValueType(expected: blueprintComponent, actual: pathComponent) }
            return .float(float)
        case .stringPlaceholder, .string:
            return .string(pathComponent)
        }
    }
}

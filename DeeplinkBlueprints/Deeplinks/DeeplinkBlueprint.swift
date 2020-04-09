//
//  DeeplinkBlueprint.swift
//  DeeplinkBlueprints
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Foundation

public struct DeeplinkBlueprint: Hashable {
    public let scheme: String
    public let components: [DeeplinkBlueprintComponent]
    
    public var pattern: String {
        guard components.count > 0 else { return scheme + "://" }
        return components.reduce(scheme + ":/", { $0 + "/" + $1.pattern })
    }
    
    public func urlString() throws -> String {
        guard components.count > 0 else { return scheme + "://" }
        return try components.reduce(scheme + ":/", { try $0 + "/" + $1.pathComponent() })
    }
    
    public func url() throws -> URL? {
        return try URL(string: urlString())
    }
    
    public init(scheme: String, components: [DeeplinkBlueprintComponent]) {
        self.scheme = scheme
        self.components = components
    }
    
    public static func ~= (blueprint: DeeplinkBlueprint, url: URL) -> Bool {
        return checkScheme(ofURL: url, matching: blueprint.scheme)
            && (blueprint.components ~= url.components)
    }
    
    public static func ~> (blueprint: DeeplinkBlueprint, url: URL) throws -> DeeplinkBlueprint {
        guard checkScheme(ofURL: url, matching: blueprint.scheme) else { throw DeeplinkBlueprintError.invalidScheme }
        return try DeeplinkBlueprint(scheme: blueprint.scheme, components: blueprint.components ~> url.components)
    }
    
    private static func checkScheme(ofURL url: URL, matching scheme: String) -> Bool {
        return url.scheme == scheme
    }
}

private extension URL {
    var components: [String] {
        return [[self.host ?? "/"], self.pathComponents]
            .flatMap { $0 }
            .filter { $0 != "/" }
    }
}

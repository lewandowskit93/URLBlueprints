//
//  Array+Extract.swift
//  URLBlueprints
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public func <~ (deeplinkComponents: [URLBlueprintComponent], pathComponents: [String]) throws -> [URLBlueprintComponent] {
    guard deeplinkComponents.count == pathComponents.count else { throw URLBlueprintError.invalidComponentCount }
    return try zip(deeplinkComponents, pathComponents)
        .map { try $0 <~ $1 }
}

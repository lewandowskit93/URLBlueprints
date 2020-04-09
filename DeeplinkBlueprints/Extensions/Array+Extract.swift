//
//  Array+Extract.swift
//  DeeplinkBlueprints
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public func ~> (deeplinkComponents: [DeeplinkBlueprintComponent], pathComponents: [String]) throws -> [DeeplinkBlueprintComponent] {
    guard deeplinkComponents.count == pathComponents.count else { throw DeeplinkBlueprintError.invalidComponentCount }
    return try zip(deeplinkComponents, pathComponents)
        .map { try $0 ~> $1 }
}

//
//  Array+Match.swift
//  URLBlueprintsTests_iOS
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public func ~= (deeplinkComponents: [URLBlueprintComponent], pathComponents: [String]) -> Bool {
    guard deeplinkComponents.count == pathComponents.count else { return false }
    return zip(deeplinkComponents, pathComponents)
        .map { $0 ~= $1 }
        .allSatisfy { $0 }
}

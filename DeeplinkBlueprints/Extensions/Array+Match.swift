//
//  Array+Match.swift
//  DeeplinkBlueprintsTests_iOS
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public func ~= (deeplinkComponents: [DeeplinkBlueprintComponent], pathComponents: [String]) -> Bool {
    guard deeplinkComponents.count == pathComponents.count else { return false }
    return zip(deeplinkComponents, pathComponents)
        .map { $0 ~= $1 }
        .reduce(true, { $0 && $1 })
}

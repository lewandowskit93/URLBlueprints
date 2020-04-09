//
//  DeeplinkBlueprintError.swift
//  DeeplinkBlueprints
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public enum DeeplinkBlueprintError: Equatable, Error {
    case invalidScheme
    case invalidComponentCount
    case invalidValueType(expected: DeeplinkBlueprintComponent, actual: String)
    case placeholdersInBlueprint
}

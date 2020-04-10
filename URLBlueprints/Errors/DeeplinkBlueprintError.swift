//
//  URLBlueprintError.swift
//  URLBlueprints
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public enum URLBlueprintError: Equatable, Error {
    case invalidScheme
    case invalidComponentCount(expected: Int, actual: Int)
    case invalidValueType(expected: URLBlueprintComponent, actual: String)
    case placeholdersInBlueprint
}

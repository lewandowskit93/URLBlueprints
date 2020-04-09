//
//  RouteError.swift
//  URLBlueprints
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public enum RouteError: Equatable {
    case notFound
    case parsingError(URLBlueprintError)
    case unknownError
}

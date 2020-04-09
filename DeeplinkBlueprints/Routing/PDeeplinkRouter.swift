//
//  PDeeplinkRouter.swift
//  DeeplinkBlueprints
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Foundation

public protocol PDeeplinkRouter {
    associatedtype DeeplinkType
    func canHandleURL(url: URL) -> Bool
    func route(forUrl url: URL) -> Route<DeeplinkType>
    func register(blueprint: DeeplinkBlueprint, routeProvider: @escaping (DeeplinkBlueprint) -> Route<DeeplinkType>)
}

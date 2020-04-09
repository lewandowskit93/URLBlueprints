//
//  PURLRouter.swift
//  URLBlueprints
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Foundation

public protocol PURLRouter {
    associatedtype DeeplinkType
    func canHandleURL(url: URL) -> Bool
    func route(forUrl url: URL) -> Route<DeeplinkType>
    func register(blueprint: URLBlueprint, routeProvider: @escaping (URLBlueprint) -> Route<DeeplinkType>)
}

//
//  Route.swift
//  URLBlueprints
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Foundation

public enum Route<DeeplinkType> {
    case handleDeeplink(deeplink: DeeplinkType)
    case redirect(toURL: URL)
    case error(_ error: RouteError)
    case blank
}

extension Route: Equatable where DeeplinkType: Equatable {}

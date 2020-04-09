//
//  URLRouter.swift
//  URLBlueprints
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Foundation

public final class URLRouter<DeeplinkType>: PURLRouter {
    private var routes: [URLBlueprint: (URLBlueprint) -> Route<DeeplinkType>] = [:]
    
    public init() {
        
    }
    
    public func canHandleURL(url: URL) -> Bool {
        if case .error = route(forUrl: url) { return false }
        return true
    }
    
    public func register(blueprint: URLBlueprint, routeProvider: @escaping (URLBlueprint) -> Route<DeeplinkType>) {
        routes[blueprint] = routeProvider
    }
    
    public func route(forUrl url: URL) -> Route<DeeplinkType> {
        guard let routeDescription = routes.first(where: { $0.0 ~= url }) else { return .error(.notFound) }
        do {
            let parsedDeeplink = try routeDescription.0 <~ url
            return routeDescription.1(parsedDeeplink)
        } catch let error where error is URLBlueprintError {
            return .error(.parsingError(error as! URLBlueprintError))
        } catch {
            return .error(.unknownError)
        }
    }
}

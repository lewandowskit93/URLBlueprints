//
//  ExampleDeeplinks.swift
//  Example
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public enum ExampleDeeplink: Equatable {
    case simple1
    case simple2
    case complex1(userId: Int)
    case complex2(userId: Int, itemId: String)
    
    public var deeplink: ExampleDeeplinkBlueprints {
        switch self {
        case .simple1: return .simple1
        case .simple2: return .simple2
        case .complex1(let userId): return .complex1(userId: .int(userId))
        case .complex2(let userId, let itemId): return .complex2(userId: .int(userId), itemId: .string(itemId))
        }
    }
}

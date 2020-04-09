//
//  ExampleDeeplinkBlueprints.swift
//  Example
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import DeeplinkBlueprints

public enum ExampleDeeplinkBlueprints {
    case simple1
    case simple2
    case complex1(userId: DeeplinkBlueprintComponent)
    case complex2(userId: DeeplinkBlueprintComponent, itemId: DeeplinkBlueprintComponent)
    
    public var blueprint: DeeplinkBlueprint {
        return DeeplinkBlueprint(
            scheme: "example",
            components: components
        )
    }
    
    private var components: [DeeplinkBlueprintComponent] {
        switch self {
        case .simple1:
            return [.constant("simple"), .constant("index.html")]
        case .simple2:
            return [.constant("simple"), .constant("resources"), .constant("image.jpg")]
        case .complex1(let p1):
            return [.constant("complex"), .constant("user"), p1]
        case .complex2(let p1, let p2):
            return [.constant("complex"), .constant("user"), p1, .constant("items"), p2, .wildcard]
        }
    }
}

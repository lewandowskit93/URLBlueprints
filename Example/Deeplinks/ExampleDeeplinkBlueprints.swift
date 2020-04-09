//
//  ExampleURLBlueprints.swift
//  Example
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import URLBlueprints

public enum ExampleURLBlueprints {
    case simple1
    case simple2
    case complex1(userId: URLBlueprintComponent)
    case complex2(userId: URLBlueprintComponent, itemId: URLBlueprintComponent)
    
    public var blueprint: URLBlueprint {
        return URLBlueprint(
            scheme: "example",
            components: components
        )
    }
    
    private var components: [URLBlueprintComponent] {
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

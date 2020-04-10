//
//  Counted.swift
//  URLBlueprintsTests_iOS
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public enum Counted<T> {
    case n0
    case n1(T)
    case n2(T, T)
    case n3(T, T, T)
    case n4(T, T, T, T)
    case n5(T, T, T, T, T)
    case n6(T, T, T, T, T, T)
    case n7(T, T, T, T, T, T, T)
    case n8(T, T, T, T, T, T, T, T)
    case n9(T, T, T, T, T, T, T, T, T)
    indirect case n10(T, T, T, T, T, T, T, T, T, T, other: Counted<T>)
    
    public init(_ components: [T]) {
        switch components.count {
        case 0: self = .n0
        case 1: self = .n1(components[0])
        case 2: self = .n2(components[0], components[1])
        case 3: self = .n3(components[0], components[1], components[2])
        case 4: self = .n4(components[0], components[1], components[2], components[3])
        case 5: self = .n5(components[0], components[1], components[2], components[3], components[4])
        case 6: self = .n6(components[0], components[1], components[2], components[3], components[4], components[5])
        case 7: self = .n7(components[0], components[1], components[2], components[3], components[4], components[5], components[6])
        case 8: self = .n8(components[0], components[1], components[2], components[3], components[4], components[5], components[6], components[7])
        case 9: self = .n9(components[0], components[1], components[2], components[3], components[4], components[5], components[6], components[7], components[8])
        case 10: self = .n10(components[0], components[1], components[2], components[3], components[4], components[5], components[6], components[7], components[8], components[9], other: .n0)
        default: self = .n10(components[0], components[1], components[2], components[3], components[4], components[5], components[6], components[7], components[8], components[9], other: Counted(Array(components[10...components.count])))
        }
    }
}

extension Counted: Equatable where T: Equatable {}

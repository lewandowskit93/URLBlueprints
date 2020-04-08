// swift-tools-version:5.2
//
//  Package.swift
//  DeeplinkBlueprints
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//
import PackageDescription

let package = Package(
    name: "DeeplinkBlueprints",
    products: [
        .library(
            name: "DeeplinkBlueprints",
            targets: ["DeeplinkBlueprints"])
    ],
    targets: [
        .target(
            name: "DeeplinkBlueprints",
            dependencies: [],
            path: "DeeplinkBlueprints"),
        .testTarget(
            name: "DeeplinkBlueprintsTests",
            dependencies: ["DeeplinkBlueprints"],
            path: "DeeplinkBlueprintsTests")
    ]
)

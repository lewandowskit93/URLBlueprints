// swift-tools-version:5.2
//
//  Package.swift
//  URLBlueprints
//
//  Created by Tomasz Lewandowski on 09/04/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//
import PackageDescription

let package = Package(
    name: "URLBlueprints",
    products: [
        .library(
            name: "URLBlueprints",
            targets: ["URLBlueprints"])
    ],
    targets: [
        .target(
            name: "URLBlueprints",
            dependencies: [],
            path: "URLBlueprints"),
        .testTarget(
            name: "URLBlueprintsTests",
            dependencies: ["URLBlueprints"],
            path: "URLBlueprintsTests")
    ]
)

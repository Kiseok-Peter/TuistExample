//
//  Package.swift
//  Dependencies
//
//  Created by 박기석 on 12/18/23.
//

import PackageDescription

let package = Package(
    name: "PackageName",
    dependencies: [
        .package(url: "https://github.com/layoutBox/FlexLayout.git", from: "2.0.3"),
        .package(url: "https://github.com/layoutBox/PinLayout.git", from: "1.10.5"),
    ]
)

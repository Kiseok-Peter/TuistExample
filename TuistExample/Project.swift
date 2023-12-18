import ProjectDescription
import ProjectDescriptionHelpers
import TuistTemplate
import StringSynthesizer

let name = "TuistExample"
let organizationName = "kr.kiseok"

// MARK: - Info.plist

let infoPlist: [String: Plist.Value] = [
    "CFBundleShortVersionString": "1.0",
    "CFBundleVersion": "1",
    "UIMainStoryboardFile": "",
    "UILaunchStoryboardName": "LaunchScreen"
]

// MARK: - Base Settings

let base: SettingsDictionary = [
    "GCC_PREPROCESSOR_DEFINITIONS": ["FLEXLAYOUT_SWIFT_PACKAGE=1"],
    "HEADER_SEARCH_PATHS": .array([
        "$(inherited)",
        "$(SRCROOT)/../Tuist/Dependencies/SwiftPackageManager/.build/checkouts/FlexLayout/Sources/YogaKit/include",
        "$(SRCROOT)/../Tuist/Dependencies/SwiftPackageManager/.build/checkouts/FlexLayout/Sources/YogaKit/include/YogaKit/",
        "$(SRCROOT)/../Tuist/Dependencies/SwiftPackageManager/.build/checkouts/FlexLayout/Sources/YogaKit/./",
        "$(SRCROOT)/../Tuist/Dependencies/SwiftPackageManager/.build/checkouts/FlexLayout/Sources/yoga/include",
        "$(SRCROOT)/../Tuist/Dependencies/SwiftPackageManager/.build/checkouts/FlexLayout/Sources/yoga/include/yoga/",
        "$(SRCROOT)/../Tuist/Dependencies/SwiftPackageManager/.build/checkouts/FlexLayout/Sources/yoga/./",
        "$(SRCROOT)/../Tuist/Dependencies/SwiftPackageManager/.build/checkouts/FlexLayout/Sources/Swift/include/yoga/",
        "$(SRCROOT)/../Tuist/Dependencies/SwiftPackageManager/.build/checkouts/FlexLayout/Sources/Swift/"
    ])
]

// MARK: - Configurations

let configurations = Configuration.default([
    .debug(name: .debug, settings: ["GCC_PREPROCESSOR_DEFINITIONS": ["DEBUG=1", "FLEXLAYOUT_SWIFT_PACKAGE=1"]]),
    .release(name: "DebugView", settings: ["SWIFT_OPTIMIZATION_LEVEL": "-Onone"])
])

// MARK: - Target

let targets = [Target(name: name,
                      destinations: .iOS,
                                    product: .app,
                      bundleName: organizationName,
                      infoPlist: .extendingDefault(with: infoPlist),
                      sources: [
                        "Sources/**"
                      ],
                      resources: [
                        "Resources/**"
                      ],
                      dependencies: [
                        .project(target: "TuistExampleKit", path: .relativeToRoot("Modules/TuistExampleKit")),
                        .project(target: "TuistExampleUI", path: .relativeToRoot("Modules/TuistExampleUI")),
                        .project(target: "CommonFoundation", path: .relativeToRoot("Modules/Common/CommonFoundation")),
                        .external(name: "FlexLayout"),
                        .external(name: "PinLayout"),
                      ],
                      settings: .settings(base: base,
                                          configurations: configurations)),
               Target(name: "\(name)Tests",
                      destinations: .iOS,
                      product: .unitTests,
                      bundleName: organizationName,
                      sources: [
                        "Tests/**"
                      ],
                      dependencies: [.target(name: name)])]

// MARK: - Project

let project = Project(name: name,
                      organizationName: organizationName,
                      targets: targets,
                      schemes: [Scheme(name: name, targetName: name, isAddTest: true)],
                      resourceSynthesizers: .default + [.strings])

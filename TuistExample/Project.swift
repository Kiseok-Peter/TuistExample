import ProjectDescription
import ProjectDescriptionHelpers
import TuistTemplate

let name = "TuistExample"
let organizationName = "kr.kiseok"

// MARK: - Info.plist

let infoPlist: [String: Plist.Value] = [
    "CFBundleShortVersionString": "1.0",
    "CFBundleVersion": "1",
    "UIMainStoryboardFile": "",
    "UILaunchStoryboardName": "LaunchScreen"
]

// MARK: - Configurations

let configurations = Configuration.default([
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
                        .project(target: "CommonFoundation", path: .relativeToRoot("Modules/Common/CommonFoundation"))
                      ],
                      settings: .settings(configurations: configurations)),
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
                      schemes: [Scheme(name: name, targetName: name, isAddTest: true)])

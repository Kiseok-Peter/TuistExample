import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

/*
                +-------------+
                |             |
                |     App     | Contains TuistExample App target and TuistExample unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Project

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

let name = "TuistExample"

let infoPlist: [String: InfoPlist.Value] = [
    "CFBundleShortVersionString": "1.0",
    "CFBundleVersion": "1",
    "UIMainStoryboardFile": "",
    "UILaunchStoryboardName": "LaunchScreen"
]

let targets = [Project.createTarget(name: name,
                                    product: .app,
                                    infoPlist: .extendingDefault(with: infoPlist),
                                    sources: [
                                        "Sources/**"
                                    ],
                                    resources: [
                                        "Resources/**"
                                    ],
                                    dependencies: [
                                        .project(target: "TuistExampleKit", path: "../Modules/TuistExampleKit"),
                                        .project(target: "TuistExampleUI", path: "../Modules/TuistExampleUI")
                                        .project(target: "CommonFoundation", path: .relativeToRoot("Modules/Common/CommonFoundation"))
                                    ]),
               Project.createTarget(name: "\(name)Tests",
                                    product: .unitTests,
                                    sources: [
                                        "Tests/**"
                                    ],
                                    dependencies: [.target(name: name)])]

let project = Project(name: name,
                      targets: targets)

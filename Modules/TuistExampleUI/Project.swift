import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

// MARK: - Project

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

let name = "TuistExampleUI"

let targets = [Project.createTarget(name: name,
                                    product: .framework,
                                    sources: [
                                        "Sources/**"
                                    ]),
               Project.createTarget(name: "\(name)Tests",
                                    product: .unitTests,
                                    sources: [
                                        "Tests/**"
                                    ],
                                    dependencies: [.target(name: name)])]

let project = Project(name: name,
                      targets: targets)

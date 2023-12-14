import ProjectDescription
import ProjectDescriptionHelpers
import TuistTemplate

// MARK: - Project

let name = "TuistExampleUI"
let organizationName = "kr.kiseok"

let targets = [Target(name: name,
                      product: .framework,
                      bundleName: organizationName,
                      sources: [
                        "Sources/**"
                      ],
                      resources: [
                        "Resources/**"
                      ]),
               Target(name: "\(name)Tests",
                      product: .unitTests,
                      bundleName: organizationName,
                      sources: [
                        "Tests/**"
                      ],
                      dependencies: [.target(name: name)])]

let project = Project(name: name,
                      targets: targets)

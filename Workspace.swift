//
//  Workspace.swift
//  ProjectDescriptionHelpers
//
//  Created by 박기석 on 11/17/23.
//

import ProjectDescription

let workspace = Workspace(name: "TuistExample",
                          projects: [
                            .relativeToRoot("TuistExample"),
                            .relativeToRoot("Modules/TuistExampleKit"),
                            .relativeToRoot("Modules/TuistExampleUI"),
                            .relativeToRoot("Modules/Common/CommonFoundation")
                          ])

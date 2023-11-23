//
//  Workspace.swift
//  ProjectDescriptionHelpers
//
//  Created by 박기석 on 11/17/23.
//

import ProjectDescription

let workspace = Workspace(name: "TuistExample",
                          projects: [
                            "TuistExample",
                            "Modules/TuistExampleKit",
                            "Modules/TuistExampleUI",
                            "Modules/Common/CommonFoundation"
                          ])

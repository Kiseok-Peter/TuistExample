//
//  Scheme+Templates.swift
//  ProjectDescriptionHelpers
//
//  Created by kiseok.park on 12/13/23.
//

import ProjectDescription

extension Scheme {
    public init(name: String,
                targetName: String,
                shared: Bool = true,
                hidden: Bool = false,
                configurationName: ConfigurationName = .debug,
                isAddTest: Bool = false) {
        let testAction: TestAction?
        if isAddTest {
            testAction = .targets(["\(targetName)Tests"],
                                  configuration: configurationName,
                                  options: .options(coverage: true,
                                                    codeCoverageTargets: [.init(stringLiteral: targetName)]))
        } else {
            testAction = nil
        }
        
        self.init(name: name, // 스킴 이름
                  shared: shared, // 스킴 공유 여부
                  hidden: hidden, // 스킴 숨김 여부
                  buildAction: BuildAction(targets: [.init(stringLiteral: targetName)]),
                  testAction: testAction)
    }
}

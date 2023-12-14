//
//  Configurations+Templates.swift
//  ProjectDescriptionHelpers
//
//  Created by kiseok.park on 12/12/23.
//

import ProjectDescription

extension Configuration {
    public static func `default`(_ configurations: [Configuration]) -> [Configuration] {
        var configurations = configurations
        
        if configurations.first(where: { $0.name == ConfigurationName.debug }) == nil {
            configurations.append(.debug(name: .debug))
        }
        if configurations.first(where: { $0.name == ConfigurationName.release }) == nil {
            configurations.append(.release(name: .release))
        }
        
        return configurations
    }
}

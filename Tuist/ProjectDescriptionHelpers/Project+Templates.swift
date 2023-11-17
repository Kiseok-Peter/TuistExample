import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    /// Helper function to create the Project for this ExampleApp
    public static func app(name: String, platform: Platform, additionalTargets: [String]) -> Project {
        var targets = makeAppTargets(name: name,
                                     platform: platform,
                                     dependencies: additionalTargets.map { TargetDependency.target(name: $0) })
        targets += additionalTargets.flatMap({ makeFrameworkTargets(name: $0, platform: platform) })
        return Project(name: name,
                       organizationName: "tuist.io",
                       targets: targets)
    }

    // MARK: - Private

    /// Helper function to create a framework target and an associated unit test target
    private static func makeFrameworkTargets(name: String, platform: Platform) -> [Target] {
        let sources = Target(name: name,
                platform: platform,
                product: .framework,
                bundleId: "io.tuist.\(name)",
                infoPlist: .default,
                sources: ["Targets/\(name)/Sources/**"],
                resources: [],
                dependencies: [])
        let tests = Target(name: "\(name)Tests",
                platform: platform,
                product: .unitTests,
                bundleId: "io.tuist.\(name)Tests",
                infoPlist: .default,
                sources: ["Targets/\(name)/Tests/**"],
                resources: [],
                dependencies: [.target(name: name)])
        return [sources, tests]
    }

    /// Helper function to create the application target and the unit test target.
    private static func makeAppTargets(name: String, platform: Platform, dependencies: [TargetDependency]) -> [Target] {
        let platform: Platform = platform
        let infoPlist: [String: InfoPlist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen"
            ]

        let mainTarget = Target(
            name: name,
            platform: platform,
            product: .app,
            bundleId: "io.tuist.\(name)",
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Targets/\(name)/Sources/**"],
            resources: ["Targets/\(name)/Resources/**"],
            dependencies: dependencies
        )

        let testTarget = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "io.tuist.\(name)Tests",
            infoPlist: .default,
            sources: ["Targets/\(name)/Tests/**"],
            dependencies: [
                .target(name: "\(name)")
        ])
        return [mainTarget, testTarget]
    }
    
    /// bundle 기본 이름
    private static var bundleName: String { "kr.kiseok" }
    
    /**
     타겟 생성 함수
     
     - Parameters:
        - name: 타겟 이름 설정.
        - platform: 타겟 플랫폼 설정. default iOS
        - product: 타겟 product 설정. (ex: app, unitTest, framework 등...)
        - infoPlist: info.plist 설정
        - sources: 소스 경로 설정
        - resources: 리소스 경로 설정
        - scripts: 스크립트 설정
        - dependencies: 의존성 설정
        - settings: 세팅 설정
     */
    public static func createTarget(name: String,
                                    platform: Platform = .iOS,
                                    product: Product,
                                    infoPlist: InfoPlist = .default,
                                    sources: SourceFilesList,
                                    resources: ResourceFileElements? = nil,
                                    scripts: [TargetScript] = [],
                                    dependencies: [TargetDependency] = [],
                                    settings: Settings? = nil) -> Target {
        Target(name: name, // 타겟 이름 설정
               platform: platform, // 타겟 플랫폼 설정
               product: product, // 타겟 product 설정 (ex: app, unitTest, framework 등...)
               bundleId: "\(bundleName).\(name)",
               infoPlist: infoPlist, // info.plist 설정
               sources: sources, // 소스 경로 설정
               resources: resources, // 리소스 경로 설정
               scripts: scripts, // 스크립트 설정
               dependencies: dependencies, // 의존성 설정
               settings: settings) // 세팅 설정
    }
}

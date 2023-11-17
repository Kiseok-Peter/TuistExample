import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
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

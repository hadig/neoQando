import ProjectDescription

private let appName = "neoQando"
private let infoPlist: [String: InfoPlist.Value] = [
    "CFBundleShortVersionString": "1.0",
    "CFBundleVersion": "1",
    "UIMainStoryboardFile": "",
    "UILaunchStoryboardName": "LaunchScreen"
    ]

let project = Project(
    name: appName,
    organizationName: "Hadi G.",
    packages: [
    
    ],
    targets: [
        Target(
            name: appName,
            platform: .iOS,
            product: .app,
            bundleId: "app.\(appName)",
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["App/Sources/**"],
            resources: ["App/Resources/**"],
            dependencies: [
            
            ]
        )
    ],
    additionalFiles: [
        "README.md"
    ]
)

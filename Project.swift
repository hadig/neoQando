import ProjectDescription

private let appName = "neoQando"
private let infoPlist: [String: InfoPlist.Value] = [
    "CFBundleShortVersionString": "1.0",
    "CFBundleVersion": "1",
    "UIMainStoryboardFile": "",
    "UILaunchStoryboardName": "LaunchScreen",
    "UISupportedInterfaceOrientations": ["UIInterfaceOrientationPortrait"],
    "NSLocationWhenInUseUsageDescription": "Your location will be used to find nearby stations."
    ]

let testScheme = Scheme(
    name: "Tests",
    testAction: TestAction
        .testPlans([
            "App/Tests/AllTests.xctestplan"
        ])
)

let project = Project(
    name: appName,
    organizationName: "Hadi G.",
    packages: [
        .package(path: "Packages/Network"),
        .package(path: "Packages/Location")
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
                .package(product: "Network"),
                .package(product: "Location")
            ]
        )
    ],
    schemes: [
        testScheme
    ],
    additionalFiles: [
        "README.md",
        "App/Tests/**"
    ]
)

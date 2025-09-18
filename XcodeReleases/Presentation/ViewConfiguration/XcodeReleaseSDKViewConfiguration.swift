import SwiftUI

public enum XcodeReleaseSDKViewConfiguration {
    
    case macOS
    case watchOS
    case iOS
    case visionOS
    case tvOS
}

extension XcodeReleaseSDKViewConfiguration {
    init(entity: XcodeReleaseSDK) {
        switch entity {
        case .macOS:
            self = .macOS
        case .iOS:
            self = .iOS
        case .tvOS:
            self = .tvOS
        case .watchOS:
            self = .watchOS
        case .visionOS:
            self = .visionOS
        }
    }
}

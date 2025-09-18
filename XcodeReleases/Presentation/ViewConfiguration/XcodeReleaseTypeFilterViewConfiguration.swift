import SwiftUI
import Combine

public enum XcodeReleaseTypeFilterViewConfiguration: RawRepresentable, CaseIterable {
    case all
    case release
    case beta
    
    public typealias RawValue = String
    
    public init?(rawValue: String) {
        switch rawValue {
        case "All":
            self = .all
        case "Release":
            self = .release
        case "Beta":
            self = .beta
        default:
            return nil
        }
    }
    
    public var rawValue: String {
        switch self {
        case .all:
            return "All"
        case .release:
            return "Release"
        case .beta:
            return "Beta"
        }
    }
}

extension XcodeReleaseTypeFilterViewConfiguration {
    
    func entity() -> XcodeReleaseTypeFilter {
        switch self {
        case .all:
            return .all
        case .beta:
            return .beta
        case .release:
            return .release
        }
    }
}

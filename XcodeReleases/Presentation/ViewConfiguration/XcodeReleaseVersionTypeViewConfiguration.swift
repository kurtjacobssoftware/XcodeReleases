import SwiftUI

public enum XcodeReleaseVersionTypeViewConfiguration {
    
    case release
    case beta(iteration: Int)
    case releaseCandidate(iteration: Int)
}

extension XcodeReleaseVersionTypeViewConfiguration {
    init(entity: XcodeReleaseType) {
        switch entity {
        case .release:
            self =  .release
        case .beta(let iteration):
            self = .beta(iteration: iteration)
        case .releaseCandidate(let iteration):
            self = .releaseCandidate(iteration: iteration)
        }
    }
}

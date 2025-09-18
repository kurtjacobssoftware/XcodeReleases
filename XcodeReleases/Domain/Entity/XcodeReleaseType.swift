import Foundation

public enum XcodeReleaseType: Equatable {
    case release
    case beta(iteration: Int)
    case releaseCandidate(iteration: Int)
}

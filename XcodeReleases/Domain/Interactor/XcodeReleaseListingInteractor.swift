import Foundation

public class XcodeReleaseListingInteractor: XcodeReleaseListingUseCase {
    
    private var xcodeReleasesProvider: XcodeReleasesProvider
    
    public init(xcodeReleasesProvider: XcodeReleasesProvider) {
        self.xcodeReleasesProvider = xcodeReleasesProvider
    }
    
    public func get(filter: XcodeReleaseTypeFilter = .all) async throws -> [XcodeRelease] {
        switch filter {
        case .release:
            if xcodeReleasesProvider.hasCachedItems() {
                let releases = xcodeReleasesProvider.getCached()
                return releases.filter { $0.releaseType == .release}
            } else {
                let releases = try await xcodeReleasesProvider.get()
                return releases.filter { $0.releaseType == .release}
            }
        case .beta:
            if xcodeReleasesProvider.hasCachedItems() {
                let releases = xcodeReleasesProvider.getCached()
                return releases.filter {
                    switch $0.releaseType {
                        case .beta:
                            return true
                        case .releaseCandidate:
                            return true
                    default:
                        return false
                    }
                }
            } else {
                let releases = try await xcodeReleasesProvider.get()
                return releases.filter {
                    switch $0.releaseType {
                        case .beta:
                            return true
                        case .releaseCandidate:
                            return true
                    default:
                        return false
                    }
                }
            }
        case .all:
            if xcodeReleasesProvider.hasCachedItems() {
                let releases = xcodeReleasesProvider.getCached()
                return releases
            } else {
                let releases = try await xcodeReleasesProvider.get()
                return releases
            }
        }
    }
}

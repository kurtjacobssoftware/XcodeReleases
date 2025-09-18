import Foundation

public protocol XcodeReleaseListingUseCase {
    func get(filter: XcodeReleaseTypeFilter) async throws -> [XcodeRelease]
}

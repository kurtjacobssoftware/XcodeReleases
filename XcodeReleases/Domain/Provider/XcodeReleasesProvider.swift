import Foundation

public protocol XcodeReleasesProvider {
    func get() async throws -> [XcodeRelease]
    func getCached() -> [XcodeRelease]
    func hasCachedItems() -> Bool
}

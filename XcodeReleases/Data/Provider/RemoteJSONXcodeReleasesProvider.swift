import Foundation

public class RemoteJSONXcodeReleasesProvider: XcodeReleasesProvider {
    
    private var xcodeReleasesService: XcodeReleaseService
    private var releases: [XcodeRelease] = []
    private var hasFetchedItems: Bool = false
    
    public init(xcodeReleasesService: XcodeReleaseService) {
        self.xcodeReleasesService = xcodeReleasesService
    }
    
    public func get() async throws -> [XcodeRelease] {
        let releases = try await xcodeReleasesService.get().map { XcodeRelease(dto: $0) }
        self.releases = releases
        self.hasFetchedItems = true
        return releases
    }
    
    public func getCached() -> [XcodeRelease] {
        return releases
    }
    
    public func hasCachedItems() -> Bool {
        return hasFetchedItems
    }
}

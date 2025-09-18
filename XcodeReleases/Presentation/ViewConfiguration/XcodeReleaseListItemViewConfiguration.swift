import SwiftUI

public struct XcodeReleaseListItemViewConfiguration: Identifiable {
    
    public var id: UUID
    public var name: String
    public var build: String
    public var versionNumber: String
    public var sdks: [XcodeReleaseSDKViewConfiguration]
    public var releaseNotes: URL?
    public var checksum: String?
    public var supportedPlatformVersion: String?
    public var releaseType: XcodeReleaseVersionTypeViewConfiguration
    public var releaseDate: String
    public var swiftCompiler: String?
}

extension XcodeReleaseListItemViewConfiguration {
    
    init?(entity: XcodeRelease) {
        self.id = entity.id
        self.name = entity.name
        self.build = entity.build
        self.versionNumber = entity.versionNumber
        self.sdks = entity.sdks.map { XcodeReleaseSDKViewConfiguration.init(entity: $0) }
        self.releaseNotes = entity.releaseNotes
        self.checksum = entity.checksum
        self.supportedPlatformVersion = entity.requiredPlatform
        self.releaseType = XcodeReleaseVersionTypeViewConfiguration(entity: entity.releaseType)
        let df = DateFormatter()
        df.dateFormat = "dd MMM yyyy"
        self.releaseDate = df.string(from: entity.date)
        self.swiftCompiler = entity.swiftCompiler
    }
}

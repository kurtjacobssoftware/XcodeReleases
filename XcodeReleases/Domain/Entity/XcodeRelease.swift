import Foundation

public struct XcodeRelease {
    
    public var id: UUID = UUID()
    var date: Date
    let checksum: String
    let releaseNotes: URL?
    let name: String
    let build: String
    let versionNumber: String
    let requiredPlatform: String
    let sdks: [XcodeReleaseSDK]
    let releaseType: XcodeReleaseType
    let swiftCompiler: String?
}

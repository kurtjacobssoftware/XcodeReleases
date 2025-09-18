// CHATGPT Generated

import Foundation

public extension XcodeRelease {
    
    init(dto: XcodeReleaseDTO) {
        self.id = UUID()
        self.checksum = dto.checksums?.sha1 ?? ""
        self.name = dto.name
        self.requiredPlatform = dto.requires
        self.date = Date()
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        let d = df.date(from: "\((dto.date?.day ?? 01))/\((dto.date?.month ?? 01))/\((dto.date?.year ?? 1970))")
        self.date = d ?? Date()
        if let url = dto.links?.notes?.url {
            self.releaseNotes = URL(string: url)
        } else {
            self.releaseNotes = nil
        }
        self.build = dto.version.build ?? "-"
        self.versionNumber = dto.version.number ?? "-"
        var sdks: [XcodeReleaseSDK] = []
        if dto.sdks?.macOS != nil {
            sdks.append(.macOS)
        }
        if dto.sdks?.tvOS != nil {
            sdks.append(.tvOS)
        }
        if dto.sdks?.iOS != nil {
            sdks.append(.iOS)
        }
        if dto.sdks?.visionOS != nil {
            sdks.append(.visionOS)
        }
        if dto.sdks?.watchOS != nil {
            sdks.append(.watchOS)
        }
        self.sdks = sdks
        
        var releaseType: XcodeReleaseType = .release
        if let iteration = dto.version.release?.beta {
            releaseType = .beta(iteration: iteration)
        }
        if let _ = dto.version.release?.release {
            releaseType = .release
        }
        if let iteration = dto.version.release?.rc {
            releaseType = .releaseCandidate(iteration: iteration)
        }
        self.releaseType = releaseType
        self.swiftCompiler = dto.compilers?.swift?.first?.number
    }
}

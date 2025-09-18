// CHATGPT Generated

import Foundation

public struct XcodeReleaseDTO: Codable, Identifiable {
    public var id: UUID = UUID()
    let dateOrder: Int
    let swiftOrder: Int
    let versionOrder: Int
    let checksums: Checksums?
    let compilers: Compilers?
    let date: ReleaseDate?
    let links: Links?
    let name: String
    let requires: String
    let sdks: SDKs?
    let version: Version

    enum CodingKeys: String, CodingKey {
        case dateOrder = "_dateOrder"
        case swiftOrder = "_swiftOrder"
        case versionOrder = "_versionOrder"
        case checksums, compilers, date, links, name, requires, sdks, version
    }
}

struct Checksums: Codable {
    let sha1: String
}

struct Compilers: Codable {
    let clang: [Compiler]?
    let swift: [Compiler]?
}

struct Compiler: Codable {
    let build: String?
    let number: String?
    let release: ReleaseFlag?
}

struct ReleaseFlag: Codable {
    let release: Bool?
    let beta: Int?
    let rc: Int?
}

struct ReleaseDate: Codable {
    let day: Int
    let month: Int
    let year: Int
}

struct Links: Codable {
    let download: DownloadLink?
    let notes: NotesLink?
}

struct DownloadLink: Codable {
    let architectures: [String]?
    let url: String
}

struct NotesLink: Codable {
    let url: String
}

struct SDKs: Codable {
    let iOS: [SDK]?
    let macOS: [SDK]?
    let tvOS: [SDK]?
    let visionOS: [SDK]?
    let watchOS: [SDK]?

    enum CodingKeys: String, CodingKey {
        case iOS = "iOS"
        case macOS = "macOS"
        case tvOS = "tvOS"
        case visionOS = "visionOS"
        case watchOS = "watchOS"
    }
}

struct SDK: Codable {
    let build: String?
    let number: String?
    let release: ReleaseFlag?
}

struct Version: Codable {
    let build: String?
    let number: String?
    let release: ReleaseFlag?
}

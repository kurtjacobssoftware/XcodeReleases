// CHATGPT Generated

import Foundation

struct RemoteJSONXcodeReleaseService: XcodeReleaseService {
    func get() async throws -> [XcodeReleaseDTO] {
        let url = URL(string: "https://xcodereleases.com/data.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode([XcodeReleaseDTO].self, from: data)
    }
}

public protocol XcodeReleaseService {
    func get() async throws -> [XcodeReleaseDTO]
}

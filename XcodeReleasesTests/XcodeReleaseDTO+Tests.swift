import Foundation
import Testing
@testable import XcodeReleases

@Suite("XcodeReleaseDTO Decoding")
struct XcodeReleaseDTOTests {
    @Test("Decode sample JSON")
    @MainActor
    func decodeSampleJSON() throws {
        let jsonString = """
        {
            "_dateOrder": 20250805,
            "_swiftOrder": 6002000,
            "_versionOrder": 26000000005,
            "checksums":
            {
                "sha1": "a303f632a63bcaefbaef9ce9de6f74f1b0addf61"
            },
            "compilers":
            {
                "clang":
                [
                    {
                        "build": "1700.3.16.4",
                        "number": "17.0.0",
                        "release":
                        {
                            "release": true
                        }
                    }
                ],
                "swift":
                [
                    {
                        "build": "6.2.0.16.4",
                        "number": "6.2",
                        "release":
                        {
                            "release": true
                        }
                    }
                ]
            },
            "date":
            {
                "day": 5,
                "month": 8,
                "year": 2025
            },
            "links":
            {
                "download":
                {
                    "architectures":
                    [
                        "arm64",
                        "x86_64"
                    ],
                    "url": "https://download.developer.apple.com/Developer_Tools/Xcode_26_beta_5/Xcode_26_beta_5_Universal.xip"
                },
                "notes":
                {
                    "url": "https://developer.apple.com/documentation/xcode-release-notes/xcode-26-release-notes"
                }
            },
            "name": "Xcode",
            "requires": "15.5",
            "sdks":
            {
                "iOS":
                [
                    {
                        "build": "23A5308f",
                        "number": "26.0",
                        "release":
                        {
                            "release": true
                        }
                    }
                ],
                "macOS":
                [
                    {
                        "build": "25A5327f",
                        "number": "26.0",
                        "release":
                        {
                            "release": true
                        }
                    }
                ],
                "tvOS":
                [
                    {
                        "build": "23J5327f",
                        "number": "26.0",
                        "release":
                        {
                            "release": true
                        }
                    }
                ],
                "visionOS":
                [
                    {
                        "build": "23M5311f",
                        "number": "26.0",
                        "release":
                        {
                            "release": true
                        }
                    }
                ],
                "watchOS":
                [
                    {
                        "build": "23R5328f",
                        "number": "26.0",
                        "release":
                        {
                            "release": true
                        }
                    }
                ]
            },
            "version":
            {
                "build": "17A5295f",
                "number": "26.0",
                "release":
                {
                    "beta": 5
                }
            }
        }
        """
        let data = Data(jsonString.utf8)
        let dto = try JSONDecoder().decode(XcodeReleaseDTO.self, from: data)

        #expect(dto.dateOrder == 20250805)
        #expect(dto.swiftOrder == 6002000)
        #expect(dto.versionOrder == 26000000005)
        #expect(dto.checksums.sha1 == "a303f632a63bcaefbaef9ce9de6f74f1b0addf61")
        #expect(dto.compilers.clang.count == 1)
        #expect(dto.compilers.swift.count == 1)
        #expect(dto.compilers.clang[0].build == "1700.3.16.4")
        #expect(dto.compilers.clang[0].release.release == true)
        #expect(dto.date.day == 5)
        #expect(dto.date.month == 8)
        #expect(dto.date.year == 2025)
        #expect(dto.links.download.url == "https://download.developer.apple.com/Developer_Tools/Xcode_26_beta_5/Xcode_26_beta_5_Universal.xip")
        #expect(dto.links.download.architectures == ["arm64", "x86_64"])
        #expect(dto.links.notes.url == "https://developer.apple.com/documentation/xcode-release-notes/xcode-26-release-notes")
        #expect(dto.name == "Xcode")
        #expect(dto.requires == "15.5")
        #expect(dto.sdks.iOS.first?.build == "23A5308f")
        #expect(dto.sdks.macOS.first?.build == "25A5327f")
        #expect(dto.sdks.tvOS.first?.build == "23J5327f")
        #expect(dto.sdks.visionOS.first?.build == "23M5311f")
        #expect(dto.sdks.watchOS.first?.build == "23R5328f")
        #expect(dto.version.build == "17A5295f")
        #expect(dto.version.number == "26.0")
        #expect(dto.version.release.beta == 5)
    }
}


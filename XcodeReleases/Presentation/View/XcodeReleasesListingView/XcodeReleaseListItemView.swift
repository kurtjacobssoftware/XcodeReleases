import SwiftUI

struct XcodeReleaseListItemView: View {
    
    public var viewConfiguration: XcodeReleaseListItemViewConfiguration
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Rectangle()
                    .foregroundStyle(backingColor)
                    .frame(height: 70)
            }
            VStack {
                HStack {
                    ChipView(title: "\(viewConfiguration.name) \(viewConfiguration.versionNumber)", chipColor: .white.opacity(0.7), textColor: .black)
                    Spacer()
                    ChipView(title: "Build: \(viewConfiguration.build)", chipColor: .white.opacity(0.7), textColor: .black)
                }
                
                Spacer(minLength: 10)
                Text("macOS \(viewConfiguration.supportedPlatformVersion ?? "")+")
                    .fontWeight(.semibold)
                Spacer(minLength: 10)
                if let swiftCompiler = viewConfiguration.swiftCompiler {
                    HStack {
                        Image(systemName: "swift")
                        Text("Swift \(swiftCompiler)")
                            .fontWeight(.bold)
                        
                    }
                }
                HStack {
                    Image(systemName: "calendar")
                    Text(viewConfiguration.releaseDate)
                        .fontWeight(.bold)
                    
                }
                Spacer(minLength: 25)
                HStack {
                    HStack {
                        if viewConfiguration.sdks.contains(.macOS) {
                            Image(systemName: "laptopcomputer")
                                .fontWeight(.bold)
                        }
                        if viewConfiguration.sdks.contains(.iOS) {
                            Image(systemName: "iphone")
                                .fontWeight(.bold)
                        }
                        if viewConfiguration.sdks.contains(.watchOS) {
                            Image(systemName: "applewatch")
                                .fontWeight(.bold)
                        }
                        if viewConfiguration.sdks.contains(.visionOS) {
                            Image(systemName: "vision.pro")
                                .fontWeight(.bold)
                        }
                        if viewConfiguration.sdks.contains(.tvOS) {
                            Image(systemName: "tv")
                                .fontWeight(.bold)
                        }
                    }
                    Spacer()
                    switch viewConfiguration.releaseType {
                    case let .beta(iteration):
                        ChipView(title: "Beta \(iteration)", chipColor: .white.opacity(0.7), textColor: .black)
                    case .release:
                        ChipView(title: "Release", chipColor: .white.opacity(0.7), textColor: .black)
                    case let .releaseCandidate(iteration):
                        ChipView(title: "RC \(iteration)", chipColor: .white.opacity(0.7), textColor: .black)
                    }
                }
            }
            .padding()
        }
        .background(backingColor.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 35))
        
    }
    
    var backingColor: Color {
        switch viewConfiguration.releaseType {
        case .release:
                .red
        case .beta:
                .mint
        case .releaseCandidate:
                .yellow
        }
    }
}

#Preview {
    ScrollView {
        LazyVStack(spacing: 10) {
            XcodeReleaseListItemView(viewConfiguration: XcodeReleaseListItemViewConfiguration(id: UUID(),
                                                                                              name: "Xcode",
                                                                                              build: "ABF67D",
                                                                                              versionNumber: "26.0",
                                                                                              sdks: [.macOS, .iOS,.visionOS, .tvOS, .watchOS],
                                                                                              releaseNotes: URL(string: "http://google.com")!,
                                                                                              checksum: "124314xxx",
                                                                                              supportedPlatformVersion: "16.0",
                                                                                              releaseType: .release, releaseDate: "12 Jan 2025"))
            .padding(.horizontal, 10)
            XcodeReleaseListItemView(viewConfiguration: XcodeReleaseListItemViewConfiguration(id: UUID(),
                                                                                              name: "Xcode",
                                                                                              build: "ABF67D",
                                                                                              versionNumber: "26.0",
                                                                                              sdks: [.macOS, .iOS,.visionOS, .tvOS, .watchOS],
                                                                                              releaseNotes: URL(string: "http://google.com")!,
                                                                                              checksum: "124314xxx",
                                                                                              supportedPlatformVersion: "16.0",
                                                                                              releaseType: .releaseCandidate(iteration: 2), releaseDate: "12 Jan 2025"))
            .padding(.horizontal, 10)
            XcodeReleaseListItemView(viewConfiguration: XcodeReleaseListItemViewConfiguration(id: UUID(),
                                                                                              name: "Xcode",
                                                                                              build: "ABF67D",
                                                                                              versionNumber: "26.0",
                                                                                              sdks: [.macOS, .iOS,.visionOS, .tvOS, .watchOS],
                                                                                              releaseNotes: URL(string: "http://google.com")!,
                                                                                              checksum: "124314xxx",
                                                                                              supportedPlatformVersion: "16.0",
                                                                                              releaseType: .beta(iteration: 1), releaseDate: "12 Jan 2025"))
            .padding(.horizontal, 10)
        }
    }
}

import SwiftUI
import Combine

public protocol XcodeReleasesListingViewModelDependencies {
    
    var xcodeReleasesListingUseCase: XcodeReleaseListingUseCase { get }
}

public class XcodeReleasesListingViewModel: ObservableObject {
    
    var dependencies: XcodeReleasesListingViewModelDependencies
    
    init(dependencies: XcodeReleasesListingViewModelDependencies) {
        self.dependencies = dependencies
    }
    
    @Published var items: [XcodeReleaseListItemViewConfiguration] = []
    @Published var filter: XcodeReleaseTypeFilterViewConfiguration = .all
    @Published var selectedItem: XcodeReleaseListItemViewConfiguration?
    
    func refresh() async throws {
        do {
            let items = try await dependencies.xcodeReleasesListingUseCase.get(filter: filter.entity())
            let mapped = items.compactMap { XcodeReleaseListItemViewConfiguration(entity: $0) }
            self.items = mapped
        } catch {
            print(error)
        }
    }
}

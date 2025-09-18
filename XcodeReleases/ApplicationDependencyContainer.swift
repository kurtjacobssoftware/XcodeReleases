import Foundation
import Combine

public class ApplicationDependencyContainer: ObservableObject, XcodeReleasesListingViewModelDependencies {
    
    // MARK: Service
    
    lazy public var xcodeReleasesService: XcodeReleaseService = RemoteJSONXcodeReleaseService()
    
    // MARK: Provider
    
    lazy public var xcodeReleasesProvider: XcodeReleasesProvider = RemoteJSONXcodeReleasesProvider(xcodeReleasesService: xcodeReleasesService)
    
    // MARK: UseCase
    
    lazy public var xcodeReleasesListingUseCase: XcodeReleaseListingUseCase = XcodeReleaseListingInteractor(xcodeReleasesProvider: xcodeReleasesProvider)
}

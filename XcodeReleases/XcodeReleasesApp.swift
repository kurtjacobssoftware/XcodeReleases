// Kurt Jacobs

import SwiftUI

@main
struct XcodeReleasesApp: App {
    
    private var applicationDependencies: ApplicationDependencyContainer = ApplicationDependencyContainer()
    
    var body: some Scene {
        WindowGroup {
            XcodeReleasesListingView(viewModel: XcodeReleasesListingViewModel(dependencies: applicationDependencies))
                .environmentObject(applicationDependencies)
        }
    }
}

import SwiftUI
import Combine
import WebKit

struct XcodeReleasesListingView: View {
    
    @EnvironmentObject var dependencies: ApplicationDependencyContainer
    @ObservedObject var viewModel: XcodeReleasesListingViewModel
    @State private var filter = XcodeReleaseTypeFilterViewConfiguration.all.rawValue
    @State var showingReleaseNotes: Bool = false
    
    init(viewModel: XcodeReleasesListingViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(viewModel.items) { viewConfiguration in
                        XcodeReleaseListItemView(viewConfiguration: viewConfiguration)
                            .padding(.horizontal, 10)
                            .onTapGesture {
                                viewModel.selectedItem = viewConfiguration
                                showingReleaseNotes = true
                            }
                    }
                }
            }
            .contentMargins(.top, 44, for: .automatic)
            
            VStack {
                Picker("Choose your filter", selection: $filter) {
                    ForEach(XcodeReleaseTypeFilterViewConfiguration.allCases, id: \.self.rawValue) {
                        Text($0.rawValue)
                            .fontWeight(.bold)
                    }
                }
                .pickerStyle(.segmented)
                .glassEffect(.clear)
                .padding(.horizontal, 10)
                Spacer()
            }
        }
        .refreshable {
            Task {
                try await viewModel.refresh()
            }
        }
        .onAppear {
            Task {
                try await viewModel.refresh()
            }
        }
        .onChange(of: filter) { oldValue, newValue in
            Task {
                viewModel.filter = XcodeReleaseTypeFilterViewConfiguration(rawValue: newValue) ?? .all
                try await viewModel.refresh()
            }
        }
        .sheet(isPresented: $showingReleaseNotes) {
            if let url = viewModel.selectedItem?.releaseNotes {
                NavigationView {
                    VStack {
                        Spacer()
                        WebView(url: url)
                    }
                    .navigationTitle(url.absoluteString)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(id: "Done", placement: .primaryAction) {
                            Button("Done") {
                                showingReleaseNotes = false
                            }
                            .tint(.blue)
                        }
                    }
                }
            }
        }
        .onChange(of: showingReleaseNotes) { oldValue, newValue in
            if newValue == false {
                viewModel.selectedItem = nil
            }
        }
    }
}

//#Preview {
//    ContentView()
//}

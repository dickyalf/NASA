import SwiftUI



struct HomeNavigation: View {
    @State private var path: [Screen] = []
    
    
    
    var body: some View {
        NavigationStack(path: $path) {
            HomeScreen(path: $path)
                .navigationDestination(for: Screen.self) { screen in
                    switch screen {
                    case .search:
                        SearchScreen(path: $path)
                    default:
                        HomeScreen(path: $path)
                    }
                }
        }
    }
}

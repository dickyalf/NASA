//
//  ContentView.swift
//  NASA
//
//  Created by Dicky Al Fayed on 17/05/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var path: Screen = .splash
    @State private var homePath: [Screen] = []
    
    var body: some View {
        Group{
            switch path {
                case .splash:
                    SplashScreen(path: $path)
                case .intro:
                    IntroScreen(path: $path)
                case .onboarding:
                    OnBoardingView(path: $path)
                default:
                    HomeNavigation()
            }
        }
    }

}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
        .environmentObject(LocationManager())
}

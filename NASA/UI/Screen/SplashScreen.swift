import SwiftUI


struct SplashScreen: View {
    @Binding var path: Screen

    var body: some View {
        VStack {
            Image("app_logo")
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        path = .intro
                    }
                }
        }
    }
}

#Preview {
    SplashScreen(path: .constant(.splash))
}

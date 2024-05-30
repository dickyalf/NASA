import SwiftUI

extension View {

  func toastView(toast: Binding<Toast?>) -> some View {
    self.modifier(ToastModifier(toast: toast))
  }
}

extension RecommendationModel: Equatable {
    static func == (lhs: RecommendationModel, rhs: RecommendationModel) -> Bool {
        return lhs.status == rhs.status
    }
}



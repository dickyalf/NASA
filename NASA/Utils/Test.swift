import Foundation

extension RecommendationResponse: Equatable {
    static func == (lhs: RecommendationResponse, rhs: RecommendationResponse) -> Bool {
        // Implement your equality check here
        // For example, compare properties to determine equality
        return lhs.property == rhs.property
    }
}

import Foundation

struct HistoryModel: Codable, Equatable, Hashable {
    let startingPoint: String
    let destination: String
    let budget: Int
    let stay: Int
    let peopleCount: Int
    let content: String
}

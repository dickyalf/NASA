import Foundation

struct RequestModel: Codable {
    let startingPoint: String
    let destination: String
    let budget: Int
    let stay: Int
    let peopleCount: Int
}

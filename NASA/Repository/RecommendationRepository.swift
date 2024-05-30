import Foundation


class RecommendationRepository{
    private let service: ChatGPTService
    
    init(service: ChatGPTService) {
        self.service = service
    }
    
    func createPost(postRequest: RequestModel, completion: @escaping (Result<RecommendationModel, Error>) -> Void) {
        service.getRecommendation(requestData: postRequest, completion: completion)
    }
}

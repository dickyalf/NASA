import Foundation

class DataViewModel: ObservableObject {
    private let repository: RecommendationRepository
        
    @Published var result: RecommendationModel?
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    @Published var history: [History] = []
    private let persistenceController: PersistenceController
    
    init(repository: RecommendationRepository, persistenceController: PersistenceController = .shared) {
        self.repository = repository
        self.persistenceController = persistenceController
    }
    
    func getRecommendation(startingPoint: String, destination: String, budget: Int, stay: Int, peopleCount: Int){
        let postRequest = RequestModel(startingPoint: startingPoint, destination: destination, budget: budget, stay: stay, peopleCount: peopleCount)
        isLoading = true
        repository.createPost(postRequest: postRequest) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                    case .success(let response):
                        self.result = response
                    self.persistenceController.addPostHistory(response: HistoryModel(startingPoint: startingPoint, destination: destination, budget: budget, stay: stay, peopleCount: peopleCount, content: response.content))
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func fetchPostHistory() {
        history = persistenceController.fetchPostHistory()
        
        history.forEach{ hi in
//            let h = HistoryModel(startingPoint: hi.startingPoint, destination: hi.destination, budget: hi.budget, stay: hi.stay, poepleCount: hi.poepleCount, content: hi.content)
        }
    }
    
    func test(test: String) -> String {
        return test
    }
}

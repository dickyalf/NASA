import Foundation


class ChatGPTService{
    func getRecommendation(requestData: RequestModel, completion: @escaping (Result<RecommendationModel, Error>) -> Void) {
        guard let url = URL(string: "http://192.168.100.145/recommendation") else {
            return
        }
                
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let requestBody = try JSONEncoder().encode(requestData)
            request.httpBody = requestBody
        } catch {
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let postResponse = try JSONDecoder().decode(RecommendationModel.self, from: data)
                completion(.success(postResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

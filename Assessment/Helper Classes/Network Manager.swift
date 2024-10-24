//
//  Network Manager.swift
//  Assessment
//
//  Created by Telha Wasim on 24/10/2024.
//

import Foundation

// Error handling
enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case noData
    case decodingError
}

class NetworkManager {
    
    //MARK: - VARIABLES -
    static let shared = NetworkManager()
    
    //MARK: - INITIALIZER -
    private init() {}
    
    func request<T: Decodable>(_ urlString: String, resultType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        // Create a data task
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Handle error
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Check for valid HTTP response
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            // Ensure there's data
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            // Decode the response into the expected model
            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(NetworkError.decodingError))
            }
        }
        
        // Start the task
        task.resume()
    }
}

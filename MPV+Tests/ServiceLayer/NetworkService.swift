//
//  NetworkService.swift
//  MPV+Tests
//
//  Created by MacBook on 5.03.23.
//

import Foundation

protocol NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {

    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error {
                completion(.failure(error))
                return
            }

            do {
                if let data {
                    let response = try JSONDecoder().decode([Comment].self, from: data)
                    completion(.success(response))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

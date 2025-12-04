//
//  APIClient.swift
//  AppSearchBarPT
//
//  Created by Luis Humberto Martinez Echegaray on 03/12/25.
//

import Foundation

protocol APIClientProtocol {
    func send<T: Decodable>(_ request: URLRequest?) async throws -> T
}

final class APIClient: APIClientProtocol {
    func send<T: Decodable>(_ request: URLRequest?) async throws -> T {
        guard let request = request else { throw URLError(.badURL) }
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let http = response as? HTTPURLResponse,
              (200...299).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}

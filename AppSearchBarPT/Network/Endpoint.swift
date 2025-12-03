//
//  Endpoint.swift
//  AppSearchBarPT
//
//  Created by Luis Humberto Martinez Echegaray on 03/12/25.
//

import Foundation

struct Endpoint {
    let urlRequest: URLRequest

    static func search(term: String) -> Endpoint {
        var components = URLComponents(string:
            "https://shoppapp.liverpool.com.mx/appclienteservices/services/v8/plp/sf"
        )!

        components.queryItems = [
            URLQueryItem(name: "search-string", value: term),
            URLQueryItem(name: "page-number", value: "1"),
            URLQueryItem(name: "number-of-items-per-page", value: "20"),
            URLQueryItem(name: "force-plp", value: "false"),
            URLQueryItem(name: "cleanProductName", value: "false")
        ]

        let url = components.url!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        return Endpoint(urlRequest: request)
    }
}

//
//  Endpoint.swift
//  AppSearchBarPT
//
//  Created by Luis Humberto Martinez Echegaray on 03/12/25.
//

import Foundation

struct Endpoint {
    let urlRequest: URLRequest

    static func search(term: String, page: Int = 1, pageSize: Int = 20, sort: String? = nil) -> Endpoint? {
        var components = URLComponents(string:
            "https://shoppapp.liverpool.com.mx/appclienteservices/services/v8/plp/sf"
        )

        var querys = [
            URLQueryItem(name: "page-number", value: "\(page)"),
            URLQueryItem(name: "number-of-items-per-page", value: "\(pageSize)"),
            URLQueryItem(name: "force-plp", value: "false"),
            URLQueryItem(name: "cleanProductName", value: "false")
        ]
        
        if !term.isEmpty {
            querys.append(URLQueryItem(name: "search-string", value: term))
        }
        if let sort = sort {
            querys.append(URLQueryItem(name: "sort-option", value: sort))
        }
        
        components?.queryItems = querys

        guard let url = components?.url else { return  nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        return Endpoint(urlRequest: request)
    }
}

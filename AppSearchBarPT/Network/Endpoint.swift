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


/*enum SortOption: String {
    case relevance = "relevance"
    case priceAsc = "price-asc"
    case priceDesc = "price-desc"
    case mostPopular = "most-popular"
    case rating = "rating"
}


enum HTTPMethod: String {
    case GET
}

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
    let method: HTTPMethod

    var urlRequest: URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "shoppapp.liverpool.com.mx"
        components.path = path
        components.queryItems = queryItems

        guard let url = components.url else {
            fatalError("Error construyendo URL: \(components)")
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}

extension Endpoint {

    /// Endpoint para búsqueda de productos con paginación y ordenamiento.
    static func search(term: String, page: Int, pageSize: Int = 40, sort: SortOption? = nil) -> Endpoint {

        let encodedTerm = term.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

        var items: [URLQueryItem] = [
            URLQueryItem(name: "search-string", value: encodedTerm),
            URLQueryItem(name: "page-number", value: "\(page)"),
            URLQueryItem(name: "number-of-items-per-page", value: "\(pageSize)"),
            URLQueryItem(name: "force-plp", value: "false"),
            URLQueryItem(name: "cleanProductName", value: "false")
        ]

        // Si hay sort, lo agregamos
        if let sort = sort {
            items.append(
                URLQueryItem(name: "sort-option", value: sort.rawValue)
            )
        }

        return Endpoint(
            path: "/appclienteservices/services/v8/plp/sf",
            queryItems: items,
            method: .GET
        )
    }
}*/

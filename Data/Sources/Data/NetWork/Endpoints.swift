//
//  Endpoints.swift
//  Data
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import Foundation

public enum Endpoints {
    case genres
    case trendingMovies(page: Int, genreIds: [Int]?)
    case movieDetail(id: Int)
    case search(query: String, page: Int)

    public var url: String {
        switch self {
        case .genres:
            return "\(APIConstants.baseURL)/genre/movie/list?api_key=\(APIConstants.apiKey)"
        case .trendingMovies(let page, let genreIds):
            var urlString = "\(APIConstants.baseURL)/discover/movie?include_adult=false&sort_by=popularity.desc&page=\(page)&api_key=\(APIConstants.apiKey)"
            if let genreIds = genreIds, !genreIds.isEmpty {
                let genreIdsString = genreIds.map { String($0) }.joined(separator: ",")
                urlString += "&with_genres=\(genreIdsString)"
            }
            return urlString
        case .movieDetail(let id):
            return "\(APIConstants.baseURL)/movie/\(id)?api_key=\(APIConstants.apiKey)"
        case .search(let query, let page):
            let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            return "\(APIConstants.baseURL)/search/movie?api_key=\(APIConstants.apiKey)&query=\(encodedQuery)&page=\(page)"
        }
    }
}

//
//  MovieRepositoryProtocol.swift
//  Domain
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import Combine

public protocol MovieRepositoryProtocol {
    func fetchTrendingMovies(page: Int, genreIds: [Int]?) -> AnyPublisher<[Movie], Error>
    func searchMovies(query: String, page: Int) -> AnyPublisher<[Movie], Error>
}

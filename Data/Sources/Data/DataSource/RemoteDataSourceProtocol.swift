//
//  RemoteDataSourceProtocol.swift
//  Data
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import Combine
import Domain

public protocol RemoteDataSourceProtocol {
    func fetchGenres() -> AnyPublisher<[Genre], Error>
    func fetchTrendingMovies(page: Int, genreIds: [Int]?) -> AnyPublisher<[Movie], Error>
    func fetchMovieDetail(id: Int) -> AnyPublisher<MovieDetail, Error>
    func searchMovies(query: String, page: Int) -> AnyPublisher<[Movie], Error>
}

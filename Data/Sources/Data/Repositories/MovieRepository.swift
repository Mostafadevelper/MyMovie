//
//  MovieRepository.swift
//  Data
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import Combine
import Domain

public class MovieRepository: MovieRepositoryProtocol {
    private let remoteDataSource: RemoteDataSourceProtocol

    public init(remoteDataSource: RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }

    public func fetchTrendingMovies(page: Int, genreIds: [Int]? = nil) -> AnyPublisher<[Movie], Error> {
        remoteDataSource.fetchTrendingMovies(page: page, genreIds: genreIds)
    }

    public func searchMovies(query: String, page: Int) -> AnyPublisher<[Movie], Error> {
        remoteDataSource.searchMovies(query: query, page: page)
    }
}

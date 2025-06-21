//
//  RemoteDataSource.swift
//  Data
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//
//

import Combine
import Foundation
import Domain

public class RemoteDataSource: RemoteDataSourceProtocol {
    
    // MARK: - Properties

    private let networkClient: NetworkClientProtocol

    // MARK: - Init
    
    public init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }

    // MARK: - Public
    
    public func fetchGenres() -> AnyPublisher<[Genre], Error> {
        networkClient.fetch(url: Endpoints.genres.url)
            .map { (response: GenreResponse) in response.genres }
            .eraseToAnyPublisher()
    }

    public func fetchTrendingMovies(page: Int, genreIds: [Int]? = nil) -> AnyPublisher<[Movie], Error> {
        networkClient.fetch(url: Endpoints.trendingMovies(page: page, genreIds: genreIds).url)
            .map { (response: MovieResponse) in response.results }
            .eraseToAnyPublisher()
    }

    public func fetchMovieDetail(id: Int) -> AnyPublisher<MovieDetail, Error> {
        networkClient.fetch(url: Endpoints.movieDetail(id: id).url)
    }

    public func searchMovies(query: String, page: Int) -> AnyPublisher<[Movie], Error> {
        networkClient.fetch(url: Endpoints.search(query: query, page: page).url)
            .map { (response: MovieResponse) in response.results }
            .eraseToAnyPublisher()
    }
}

private struct GenreResponse: Decodable {
    let genres: [Genre]
}

private struct MovieResponse: Decodable {
    let results: [Movie]
}

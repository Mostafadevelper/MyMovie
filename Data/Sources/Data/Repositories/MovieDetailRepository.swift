//
//  MovieDetailRepository.swift
//  Data
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import Combine
import Domain

public class MovieDetailRepository: MovieDetailRepositoryProtocol {
    private let remoteDataSource: RemoteDataSourceProtocol

    /// Initializes the repository with a remote data source.
    public init(remoteDataSource: RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }

    public func fetchMovieDetail(id: Int) -> AnyPublisher<MovieDetail, Error> {
        remoteDataSource.fetchMovieDetail(id: id)
    }
}

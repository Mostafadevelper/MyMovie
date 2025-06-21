//
//  GenreRepository.swift
//  Data
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import Combine
import Domain

public class GenreRepository: GenreRepositoryProtocol {
    private let remoteDataSource: RemoteDataSourceProtocol

    public init(remoteDataSource: RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }

    public func fetchGenres() -> AnyPublisher<[Genre], Error> {
        remoteDataSource.fetchGenres()
    }
}


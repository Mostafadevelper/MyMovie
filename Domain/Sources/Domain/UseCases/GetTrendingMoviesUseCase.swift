//
//  GetTrendingMoviesUseCase.swift
//  Domain
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import Combine

public class GetTrendingMoviesUseCase: GetTrendingMoviesUseCaseProtocol {
    
    // MARK: - Properties

    private let repository: MovieRepositoryProtocol

    // MARK: - Init
    
    public init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }

    // MARK: - Public
    
    public func execute(page: Int, genreIds: [Int]? = nil) -> AnyPublisher<[Movie], Error> {
        repository.fetchTrendingMovies(page: page, genreIds: genreIds)
    }
}

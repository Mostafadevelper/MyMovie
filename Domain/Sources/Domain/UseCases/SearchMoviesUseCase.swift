//
//  SearchMoviesUseCase.swift
//  Domain
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import Combine

public class SearchMoviesUseCase: SearchMoviesUseCaseProtocol {
    
    // MARK: - Properties

    private let repository: MovieRepositoryProtocol

    // MARK: - Init
    
    public init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }

    // MARK: - Public
    
    public func execute(query: String, page: Int) -> AnyPublisher<[Movie], Error> {
        repository.searchMovies(query: query, page: page)
    }
}

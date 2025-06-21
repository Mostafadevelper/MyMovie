//
//  GetMovieDetailUseCase.swift
//  Domain
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import Combine

public class GetMovieDetailUseCase: GetMovieDetailUseCaseProtocol {
    
    // MARK: - Properties

    private let repository: MovieDetailRepositoryProtocol

    // MARK: - Init
    
    public init(repository: MovieDetailRepositoryProtocol) {
        self.repository = repository
    }

    // MARK: - Public
    
    public func execute(id: Int) -> AnyPublisher<MovieDetail, Error> {
        repository.fetchMovieDetail(id: id)
    }
}

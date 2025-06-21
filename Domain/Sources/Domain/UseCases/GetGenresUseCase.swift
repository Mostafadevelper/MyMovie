//
//  GetGenresUseCase.swift
//  Domain
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import Combine

public class GetGenresUseCase: GetGenresUseCaseProtocol {
    
    // MARK: - Properties

    private let repository: GenreRepositoryProtocol

    // MARK: - Init
    
    public init(repository: GenreRepositoryProtocol) {
        self.repository = repository
    }

    // MARK: - Public
    
    public func execute() -> AnyPublisher<[Genre], Error> {
        repository.fetchGenres()
    }
}

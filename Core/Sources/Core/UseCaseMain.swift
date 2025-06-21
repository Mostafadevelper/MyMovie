//
//  UseCaseMain.swift
//  Main
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import Domain

public class UseCaseMain {
    
    // MARK: - Properties
    
    private let repositoryMain: RepositoryMain
    
    // MARK: - Init
    
    public init(repositoryMain: RepositoryMain) {
        self.repositoryMain = repositoryMain
    }
    
    // MARK: - Public
    
    public func createGetGenresUseCase() -> GetGenresUseCaseProtocol {
        let repository = repositoryMain.createGenreRepository()
        return GetGenresUseCase(repository: repository)
    }
    
    public func createGetTrendingMoviesUseCase() -> GetTrendingMoviesUseCaseProtocol {
        let repository = repositoryMain.createMovieRepository()
        return GetTrendingMoviesUseCase(repository: repository)
    }
    
    public func createGetMovieDetailUseCase() -> GetMovieDetailUseCaseProtocol {
        let repository = repositoryMain.createMovieDetailRepository()
        return GetMovieDetailUseCase(repository: repository)
    }
    
    public func createSearchMoviesUseCase() -> SearchMoviesUseCaseProtocol {
        let repository = repositoryMain.createMovieRepository()
        return SearchMoviesUseCase(repository: repository)
    }
}


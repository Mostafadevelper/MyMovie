//
//  MovieViewModelsBuilder.swift
//  Factories
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import Presentation
import Data
import Core
import Domain

final class MovieViewModelsBuilder {
    
    // MARK: - Properties
    
    private var networkClient: NetworkClient?
    private var remoteDataSource: RemoteDataSource?
    private var repositoryFactory: RepositoryMain?
    private var useCaseFactory: UseCaseMain?
    
    // MARK: - Methods
    
    func setNetworkClient() -> MovieViewModelsBuilder {
        self.networkClient = NetworkClient()
        return self
    }
    
    func setRemoteDataSource() -> MovieViewModelsBuilder {
        guard let networkClient = networkClient else {
            fatalError("NetworkClient must be set before RemoteDataSource")
        }
        self.remoteDataSource = RemoteDataSource(networkClient: networkClient)
        return self
    }
    
    func setRepositoryFactory() -> MovieViewModelsBuilder {
        guard let remoteDataSource = remoteDataSource else {
            fatalError("RemoteDataSource must be set before RepositoryFactory")
        }
        self.repositoryFactory = RepositoryMain(remoteDataSource: remoteDataSource)
        return self
    }
    
    func setUseCaseFactory() -> MovieViewModelsBuilder {
        guard let repositoryFactory = repositoryFactory else {
            fatalError("RepositoryFactory must be set before UseCaseFactory")
        }
        self.useCaseFactory = UseCaseMain(repositoryMain: repositoryFactory)
        return self
    }
    
    func buildMoviesViewModel() -> MoviesViewModel {
        guard let useCaseFactory = useCaseFactory else {
            fatalError("UseCaseFactory must be set before creating MoviesViewModel")
        }
        return MoviesViewModel(
            getGenresUseCase: useCaseFactory.createGetGenresUseCase(),
            getTrendingMoviesUseCase: useCaseFactory.createGetTrendingMoviesUseCase(),
            searchMoviesUseCase: useCaseFactory.createSearchMoviesUseCase()
        )
    }
    
    func buildMovieDetailViewModel(movieID: Int) -> MovieDetailViewModel {
        guard let useCaseFactory = useCaseFactory else {
            fatalError("UseCaseFactory must be set before creating MovieDetailViewModel")
        }
        return MovieDetailViewModel(
            movieID: movieID,
            getMovieDetailUseCase: useCaseFactory.createGetMovieDetailUseCase()
        )
    }
}

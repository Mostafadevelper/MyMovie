//
//  RepositoryMain.swift
//  Main
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import Domain
import Data

public class RepositoryMain {
    
    // MARK: - Properties
    
    private let remoteDataSource: RemoteDataSourceProtocol
    
    // MARK: - Init
    
    public init(remoteDataSource: RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    // MARK: - Public
    
    public func createGenreRepository() -> GenreRepositoryProtocol {
        return GenreRepository(remoteDataSource: remoteDataSource)
    }
    
    public func createMovieRepository() -> MovieRepositoryProtocol {
        return MovieRepository(remoteDataSource: remoteDataSource)
    }
    
    public func createMovieDetailRepository() -> MovieDetailRepositoryProtocol {
        return MovieDetailRepository(remoteDataSource: remoteDataSource)
    }
}


//
//  MyMovieApp.swift
//  MyMovie
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import SwiftUI
import Presentation
import Data
import Domain
import Core

@main
struct MyMovieApp: App {
    
    // MARK: - Properties
    
    let viewModelBuilder: MovieViewModelsBuilder
    var movieViewModel: MoviesViewModel
    
    // MARK: - Init
    
    init() {
        viewModelBuilder = MovieViewModelsBuilder()
            .setNetworkClient()
            .setRemoteDataSource()
            .setRepositoryFactory()
            .setUseCaseFactory()
        movieViewModel = viewModelBuilder.buildMoviesViewModel()
    }
    
    var body: some Scene {
        WindowGroup {
            MoviesListView(viewModel: movieViewModel) { movieID in
                let movieDetailViewModel = viewModelBuilder.buildMovieDetailViewModel(movieID: movieID)
                return MovieDetailView(viewModel: movieDetailViewModel)
            }
        }
    }
}


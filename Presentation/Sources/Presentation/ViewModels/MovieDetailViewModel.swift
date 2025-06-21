//
//  MovieDetailViewModel.swift
//  Presentation
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import Foundation
import Combine
import Domain

public class MovieDetailViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published public private(set) var movieDetail: MovieDetail?
    private let getMovieDetailUseCase: GetMovieDetailUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()
    private let movieID: Int

    // MARK: - Init
    
    public init(
        movieID: Int,
        getMovieDetailUseCase: GetMovieDetailUseCaseProtocol
    ) {
        self.movieID = movieID
        self.getMovieDetailUseCase = getMovieDetailUseCase
        fetchMovieDetails()
    }

    // MARK: - Public
    
    public func fetchMovieDetails() {
        getMovieDetailUseCase.execute(id: movieID)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] detail in
                self?.movieDetail = detail
            })
            .store(in: &cancellables)
    }
}

//
//  MoviesViewModel.swift
//  Presentation
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import Foundation
import Combine
import Domain

public enum ViewState: Equatable {
    case idle
    case loading
    case loaded
    case error(String)
}

public class MoviesViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published public private(set) var movies: [Movie] = []
    @Published public private(set) var genres: [Genre] = []
    @Published public var searchText: String = ""
    @Published public var selectedGenres: Set<Int> = []
    @Published public private(set) var state: ViewState = .idle
    private let getGenresUseCase: GetGenresUseCaseProtocol
    private let getTrendingMoviesUseCase: GetTrendingMoviesUseCaseProtocol
    private let searchMoviesUseCase: SearchMoviesUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()
    private var fetchMoviesCancellable: AnyCancellable?
    private var currentPage = 1
    
    // MARK: - Init
    
    public init(
        getGenresUseCase: GetGenresUseCaseProtocol,
        getTrendingMoviesUseCase: GetTrendingMoviesUseCaseProtocol,
        searchMoviesUseCase: SearchMoviesUseCaseProtocol
    ) {
        self.getGenresUseCase = getGenresUseCase
        self.getTrendingMoviesUseCase = getTrendingMoviesUseCase
        self.searchMoviesUseCase = searchMoviesUseCase
        fetchGenres()
        setupSearch()
    }
    
    // MARK: -  Private
    
    private func fetchGenres() {
        getGenresUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error fetching genres: \(error)")
                }
            }, receiveValue: { [weak self] genres in
                self?.genres = genres
            })
            .store(in: &cancellables)
    }
    
    private func fetchMovies() {
        fetchMoviesCancellable?.cancel()
        state = .loading
        let publisher: AnyPublisher<[Movie], Error>
        if !searchText.isEmpty {
            publisher = searchMoviesUseCase.execute(query: searchText, page: currentPage)
        } else {
            publisher = getTrendingMoviesUseCase
                .execute(page: currentPage, genreIds: Array(selectedGenres))
        }
        
        fetchMoviesCancellable = publisher
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.handleCompletion(completion)
            }, receiveValue: { [weak self] newMovies in
                self?.handleNewMovies(newMovies)
            })
    }
    
    private func handleCompletion(_ completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            state = .loaded
        case .failure(let error):
            state = .error(error.localizedDescription)
            print("Error fetching movies: \(error)")
        }
    }
    
    private func handleNewMovies(_ newMovies: [Movie]) {
        if currentPage == 1 {
            movies = newMovies
        } else {
            movies.append(contentsOf: newMovies)
        }
        currentPage += 1
        state = .loaded
    }
    
    private func setupSearch() {
        Publishers.CombineLatest(
            $searchText
                .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
                .removeDuplicates(),
            $selectedGenres
                .removeDuplicates()
        )
        .sink { [weak self] _, _ in
            self?.currentPage = 1
            self?.fetchMovies()
        }
        .store(in: &cancellables)
    }
    
    public func loadMoreIfNeeded(currentItem: Movie?) {
        guard let currentItem = currentItem, state == .loaded else { return }
        let thresholdIndex = movies.index(movies.endIndex, offsetBy: -5)
        if movies.firstIndex(where: { $0.id == currentItem.id }) == thresholdIndex {
            fetchMovies()
        }
    }
    
    public func fetchInitialData() {
        currentPage = 1
        fetchMovies()
    }
}

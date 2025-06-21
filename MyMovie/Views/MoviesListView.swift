//
//  MoviesListView.swift
//  TheMovieApp
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import SwiftUI
import Presentation
import Domain

struct MoviesListView<DetailView: View>: View {
    
    // MARK: - Properties
    
    @StateObject private var viewModel: MoviesViewModel
    private let buildDetailView: (Int) -> DetailView

   // MARK: - Init
    
    init(viewModel: MoviesViewModel, buildDetailView: @escaping (Int) -> DetailView) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.buildDetailView = buildDetailView
    }

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchText)
                GenreChipsView(genres: viewModel.genres, selectedGenres: $viewModel.selectedGenres)
                contentView
            }
            .navigationTitle("Watch New Movies")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.fetchInitialData()
            }
        }
    }

    // MARK: - Private
    
    @ViewBuilder
    private var contentView: some View {
        switch viewModel.state {
        case .idle:
            Spacer()
        case  .loading where viewModel.movies.isEmpty:
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        case .loaded, .loading:
            moviesList
        case .error(let message):
            VStack {
                Text("Error: \(message)")
                    .multilineTextAlignment(.center)
                    .padding()
                Button("Retry") {
                    viewModel.fetchInitialData()
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    private var moviesList: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(viewModel.movies) { movie in
                    NavigationLink(destination: buildDetailView(movie.id)) {
                        MovieRowView(movie: movie)
                            .aspectRatio(2/3, contentMode: .fit) // 👈 Ensures equal height in the row
                            .onAppear {
                                viewModel.loadMoreIfNeeded(currentItem: movie)
                            }
                    }
                }

                if viewModel.state == .loading {
                    if #available(iOS 16.0, *) {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .gridCellColumns(2)
                    }
                }
            }
            .padding()
        }
    }

}

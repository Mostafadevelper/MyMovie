//
//  GenreChipsView.swift
//  Presentation
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import SwiftUI
import Domain

public struct GenreChipsView: View {
    
    // MARK: - Properties
    
    public let genres: [Genre]
    @Binding public var selectedGenres: Set<Int>
    
    // MARK: - Init
    
    public init(
        genres: [Genre],
        selectedGenres: Binding<Set<Int>>
    ) {
        self.genres = genres
        self._selectedGenres = selectedGenres
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(genres) { genre in
                    GenreChip(genre: genre, isSelected: selectedGenres.contains(genre.id)) {
                        if selectedGenres.contains(genre.id) {
                            selectedGenres.remove(genre.id)
                        } else {
                            selectedGenres.insert(genre.id)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

public struct GenreChip: View {
    
    // MARK: - Properties
    
    public let genre: Genre
    public let isSelected: Bool
    public let action: () -> Void
    
    // MARK: - Init
    
    public init(
        genre: Genre,
        isSelected: Bool,
        action: @escaping () -> Void
    ) {
        self.genre = genre
        self.isSelected = isSelected
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(genre.name)
                .padding(8)
                .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(isSelected ? .white : .primary)
                .cornerRadius(16)
        }
    }
}


//
//  MovieRowView.swift
//  Presentation
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import SwiftUI
import Domain

public struct MovieRowView: View {
    
    // MARK: - Properties
    
    public let movie: Movie
    
    // MARK: - Init
    
    public init(movie: Movie) {
        self.movie = movie
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 8) {
            AsyncImage(url: URL(string: "\(ImageConstants.imageBaseURL)\(movie.posterPath ?? "")")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                        .clipped()
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.gray)
                @unknown default:
                    EmptyView()
                }
            }
            .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(movie.title)
                    .font(.headline)
                    .lineLimit(2)
                Text(movie.releaseYear)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(Color(.systemBackground)) // or Color.white
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
        .cornerRadius(12)
    }
}

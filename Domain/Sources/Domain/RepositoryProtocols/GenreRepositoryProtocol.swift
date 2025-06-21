//
//  GenreRepositoryProtocol.swift
//  Domain
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import Combine

public protocol GenreRepositoryProtocol {
    func fetchGenres() -> AnyPublisher<[Genre], Error>
}

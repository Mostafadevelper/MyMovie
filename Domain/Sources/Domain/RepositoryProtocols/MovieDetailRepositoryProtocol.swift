//
//  MovieDetailRepositoryProtocol.swift
//  Domain
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import Combine

public protocol MovieDetailRepositoryProtocol {
    func fetchMovieDetail(id: Int) -> AnyPublisher<MovieDetail, Error>
}

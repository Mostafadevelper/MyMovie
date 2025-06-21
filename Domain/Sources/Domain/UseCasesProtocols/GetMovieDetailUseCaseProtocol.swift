//
//  GetMovieDetailUseCase.swift
//  Domain
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import Combine

public protocol GetMovieDetailUseCaseProtocol {
    func execute(id: Int) -> AnyPublisher<MovieDetail, Error>
}


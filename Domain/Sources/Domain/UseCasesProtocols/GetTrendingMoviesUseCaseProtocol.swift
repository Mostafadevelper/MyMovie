//
//  GetTrendingMoviesUseCase.swift
//  Domain
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//
import Combine

public protocol GetTrendingMoviesUseCaseProtocol {
    func execute(page: Int, genreIds: [Int]?) -> AnyPublisher<[Movie], Error>
}

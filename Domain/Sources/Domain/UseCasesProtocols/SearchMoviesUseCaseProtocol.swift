//
//  SearchMoviesUseCaseProtocol.swift
//  Domain
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import Foundation
import Combine

public protocol SearchMoviesUseCaseProtocol {
    func execute(query: String, page: Int) -> AnyPublisher<[Movie], Error>
}

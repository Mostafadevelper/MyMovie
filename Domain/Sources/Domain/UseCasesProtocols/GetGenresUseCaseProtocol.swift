//
//  GetGenresUseCase.swift
//  Domain
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import Combine

public protocol GetGenresUseCaseProtocol {
    func execute() -> AnyPublisher<[Genre], Error>
}


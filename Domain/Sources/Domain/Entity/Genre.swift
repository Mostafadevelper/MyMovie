//
//  Genre.swift
//  Domain
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import Foundation

public struct Genre: Identifiable, Decodable {
    
    // MARK: - Properties

    public let id: Int
    public let name: String

    // MARK: - Init
    
    public init(
        id: Int, name: String
    ) {
        self.id = id
        self.name = name
    }
}

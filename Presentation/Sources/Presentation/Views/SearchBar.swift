//
//  SearchBar.swift
//  Presentation
//
//  Created by Mostafa Mahmoud on 21/06/2025.
//

import SwiftUI

public struct SearchBar: View {
    
    // MARK: - Properties
    
    @Binding public var text: String
    
    // MARK: - Init
    
    public init(
        text: Binding<String>
    ) {
        self._text = text
    }
    
    public var body: some View {
        TextField("Search...", text: $text)
            .padding(8)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

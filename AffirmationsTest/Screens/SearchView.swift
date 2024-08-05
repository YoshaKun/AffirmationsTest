//
//  SearchView.swift
//  AffirmationsTest
//
//  Created by Yosha Kun on 05.08.2024.
//

import Foundation
import SwiftUI

struct SearchView: View {
    @State private var query: String = ""
    @State private var results: [String] = []

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search", text: $query, onCommit: {
                    search()
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

                List(results, id: \.self) { result in
                    Text(result)
                }
            }
            .navigationTitle("Search Affirmations")
        }
    }

    private func search() {
        results = LocalizationHelper.shared.search(for: query)
    }
}

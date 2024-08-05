//
//  Localizadfdfdfdf.swift
//  AffirmationsTest
//
//  Created by Yosha Kun on 05.08.2024.
//

import Foundation

class LocalizationHelper {
    static let shared = LocalizationHelper()

    var localizedStrings: [String: String] = [:]

    private init() {
        loadLocalizedStrings()
    }

    private func loadLocalizedStrings() {
        guard let path = Bundle.main.path(forResource: Locale.current.languageCode, ofType: "lproj"),
              let bundle = Bundle(path: path),
              let url = bundle.url(forResource: "Localizable", withExtension: "strings"),
              let stringsDict = NSDictionary(contentsOf: url) as? [String: String] else {
            return
        }
        localizedStrings = stringsDict
    }

    func search(for query: String) -> [String] {
        let results = localizedStrings.filter { $0.value.contains(query) }
        return results.map { $0.value }
    }
}

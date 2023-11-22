//
//  FlagAPI.swift
//  Ratatouille
//
//  Created by Øystein Engell on 21/11/2023.
//

import Foundation

struct FlagAPI {
    static let CountryCodes: [String: String] = {
        return [
            "American": "US",
            "British": "GB",
            "Canadian": "CA",
            "Chinese": "CN",
            "Croatian": "HR",
            "Dutch": "NL",
            "Egyptian": "EG",
            "Filipino": "PH",
            "French": "FR",
            "Greek": "GR",
            "Indian": "IN",
            "Irish": "IE",
            "Italian": "IT",
            "Jamaican": "JM",
            "Japanese": "JP",
            "Kenyan": "KE",
            "Malaysian": "MY",
            "Mexican": "MX",
            "Moroccan": "MA",
            "Polish": "PL",
            "Portuguese": "PT",
            "Russian": "RU",
            "Spanish": "ES",
            "Thai": "TH",
            "Tunisian": "TN",
            "Turkish": "TR",
            "Unknown": "AQ",
            "Vietnamese": "VN"
        ]
    }()

    static func countryCode(for area: String) -> String {
        return CountryCodes[area] ?? "Unknown"
    }
}

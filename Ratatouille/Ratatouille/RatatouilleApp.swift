//
//  RatatouilleApp.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//
//  kingfisher for å cashe bilder

import SwiftUI

@main
struct RatatouilleApp: App {
    
    
    
    var body: some Scene {
        WindowGroup {
            TabView {
                MyRecipesView()
                    .tabItem {
                        Label("Mine Oppskrifter", systemImage: "fork.knife.circle.fill")
                    }
                SearchView()
                    .tabItem {
                        Label("Søk", systemImage: "magnifyingglass.circle.fill")
                    }
                SettingsView()
                    .tabItem {
                        Label("Innstillinger", systemImage: "gearshape")
                    }
            }
        }
    }
}

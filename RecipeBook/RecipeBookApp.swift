//
//  RecipeBookApp.swift
//  RecipeBook
//
//  Created by Emanuel Gross von Trockau on 2023-06-06.
//
import Blackbird
import SwiftUI

@main
struct RecipeBookApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeListView()
                .environment (\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}

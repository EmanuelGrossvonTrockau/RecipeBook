//
//  RecipeListView.swift
//  RecipeBook
//
//  Created by Emanuel Gross von Trockau on 2023-06-06.
//
import Blackbird
import SwiftUI

struct RecipeListView: View {
    
    @BlackbirdLiveModels ({ db in
        try await Recipe.read(from: db)
        }) var recipes
    
    
    var body: some View {
        NavigationView{
            List(recipes.results) { currentRecipe in
                RecipeView(title: currentRecipe.title,
                           steps: currentRecipe.steps,
                           ingredients: currentRecipe.ingredients)
            }
            
        }
        .navigationTitle("Recipe Book")
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RecipeListView()
                .environment (\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}

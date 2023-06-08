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
    @State var addRecipeView = false
    
    var body: some View {
        NavigationView{
            List(recipes.results) { currentRecipe in
                RecipeView(title: currentRecipe.title,
                           steps: currentRecipe.steps,
                           ingredients: currentRecipe.ingredients)
            }
            
        }
        .navigationTitle("Recipe Book")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: {
                    addRecipeView = true
                }, label: {
                    Image(systemName: "plus")
                })
                .sheet(isPresented: $addRecipeView) {
                    AddRecipeView()
                        .presentationDetents([.fraction(0.6)])
                }
            }
        }
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

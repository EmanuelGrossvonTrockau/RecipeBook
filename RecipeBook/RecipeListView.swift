//
//  RecipeListView.swift
//  RecipeBook
//
//  Created by Emanuel Gross von Trockau on 2023-06-06.
//

import SwiftUI

struct RecipeListView: View {
    var body: some View {
        NavigationView{
            List{
                RecipeView(title: "Choclate Cake", steps: "1, Get a Bowl and add all ingredients. 2. Mix everything together.                 3. Bake it for 30 min", ingredients: "Milk, Eggs, flour, choclate powder ")
                RecipeView(title: "Spagetthi Cabonara", steps: "1. Boil Hot water, add salt. 2. Prepare your souce, mix the eggs with some seasening and speck. 3. Cook the nudels 4. add the souce to the nudels after their done. ", ingredients: "Pasta, Eggs,Speck, Salt")
            }
        }
        .navigationTitle("Recipe Book")
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipeListView()
        }
    }
}

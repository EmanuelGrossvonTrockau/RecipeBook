//
//  RecipeView.swift
//  RecipeBook
//
//  Created by Emanuel Gross von Trockau on 2023-06-06.
//

import SwiftUI

struct RecipeView: View {
    let title: String
    let steps: String
    let ingredients: String
    
    var body: some View {
        
        VStack {
            
            Text(title)
                .font(.title)
                .bold()
            Text("_______________________________")
            Text(steps)
            Text("_______________________________")
            Text(ingredients)
            Text("_______________________________")
                
            Spacer()
                
            
        }
        .padding(15)
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(title: "Tomato Pasta", steps: "1. Boil the water and add salt to it 2. cook the pasta 3. Add tomato soup ", ingredients: "Pasta,salt, water, Tomato soup")
    }
}

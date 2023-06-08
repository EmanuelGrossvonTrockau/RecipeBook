//
//  AddRecipeView.swift
//  RecipeBook
//
//  Created by Emanuel Gross von Trockau on 2023-06-07.
//
import Blackbird
import SwiftUI

struct AddRecipeView: View {
    
    @Environment (\.blackbirdDatabase) var db: Blackbird.Database?
    
    @BlackbirdLiveModels({ db in
        try await Recipe.read(from: db)
    }) var recipes
    
    @State var title = ""
    @State var stpes = ""
    @State var ingredients = ""
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    Section(header: Text("Title")) {
                        TextField("Enter-Title", text: $title)
                    }
                    Section(header: Text("Steps")) {
                        TextEditor(text: $stpes)
                    }
                    Section(header: Text("Ingredients")) {
                        TextField("Enter-Ingredients", text: $ingredients)
                    }
                }
                
            }
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
            .environment (\.blackbirdDatabase, AppDatabase.instance)
    }
}

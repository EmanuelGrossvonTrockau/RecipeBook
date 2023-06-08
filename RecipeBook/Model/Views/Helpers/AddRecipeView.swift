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
    
    @State var title = ""
    @State var steps = ""
    @State var ingredients = ""
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    Section(header: Text("Title")) {
                        TextField("Enter-Title", text: $title)
                    }
                    Section(header: Text("Steps")) {
                        TextEditor(text: $steps)
                    }
                    Section(header: Text("Ingredients")) {
                        TextField("Enter-Ingredients", text: $ingredients)
                    }
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        addRecipe()
                    }, label: {
                        Text("ADD")
                    })
                }
            }
        }
    }
    
    func addRecipe() {
        Task {
            try await db!.transaction { core in
                try core.query("""
                              INSERT INTO recipe (
                              title,
                              steps,
                              ingredients
                              )
                              VALUES (
                              (?),
                              (?),
                              (?)
                              )
                              """,
                title,
                steps,
                ingredients)
            }
            title = ""
            steps = ""
            ingredients = ""
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
            .environment (\.blackbirdDatabase, AppDatabase.instance)
    }
}

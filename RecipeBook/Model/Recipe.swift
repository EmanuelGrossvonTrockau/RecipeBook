//
//  Recipe.swift
//  RecipeBook
//
//  Created by Emanuel Gross von Trockau on 2023-06-07.
//
import Blackbird
import Foundation

struct Recipe: BlackbirdModel {
     
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var title: String
    @BlackbirdColumn var steps: String
    @BlackbirdColumn var ingredients: String
    
}

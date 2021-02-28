//
//  MovieModel.swift
//  CinemaBookApp
//
//  Created by Desu Miko on 26.02.2021.
//

import Foundation

class MovieModel {
    private let baseURL = "https://api.movies.mkpwnz.moe/"
    
}


struct MovieTitle: Codable, Identifiable {
    let name: String
    let description: String
    let director: String
    let rating: Double
    let genres: [String]
    let image: String
    let id: Int
}

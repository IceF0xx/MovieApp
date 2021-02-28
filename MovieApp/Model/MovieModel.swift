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


struct MovieTitle: Codable {
    let description: String
    let genres: [String]
    let image: String
}

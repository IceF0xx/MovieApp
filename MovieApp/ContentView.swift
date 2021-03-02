//
//  ContentView.swift
//  MovieApp
//
//  Created by Desu Miko on 27.02.2021.
//

import SwiftUI

struct ContentView: View {
    static let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu justo ullamcorper quam venenatis tincidunt. In hac habitasse platea dictumst. Integer sed lorem cursus, varius nisi sed, imperdiet tortor. Curabitur tristique ultrices urna, non ullamcorper erat. Ut sit amet orci nec justo faucibus euismod. Nullam nibh nulla, pharetra id tortor sit amet, cursus fringilla eros. Aenean porttitor augue mi, sit amet porta augue luctus in. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas"
    
    static var items: [MovieTitle] = [MovieTitle(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 1), MovieTitle(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 2), MovieTitle(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 3), MovieTitle(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 4), MovieTitle(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 5), MovieTitle(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 7), MovieTitle(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 6), MovieTitle(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 10), MovieTitle(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 8), MovieTitle(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 9)]
    
    var body: some View {
        
        TitleList(movies: ContentView.items)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

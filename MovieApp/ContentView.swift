//
//  ContentView.swift
//  MovieApp
//
//  Created by Desu Miko on 27.02.2021.
//

import SwiftUI

struct ContentView: View {
    static let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu justo ullamcorper quam venenatis tincidunt. In hac habitasse platea dictumst. Integer sed lorem cursus, varius nisi sed, imperdiet tortor. Curabitur tristique ultrices urna, non ullamcorper erat. Ut sit amet orci nec justo faucibus euismod. Nullam nibh nulla, pharetra id tortor sit amet, cursus fringilla eros. Aenean porttitor augue mi, sit amet porta augue luctus in. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas"
    
    static var items: [Movie] = [Movie(name: "Lorem ipsum1", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 1), Movie(name: "Lorem ipsum2", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 2), Movie(name: "Lorem ipsum3", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 3), Movie(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 4), Movie(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 5), Movie(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.8, genres: [], image: "poster", id: 7), Movie(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 6), Movie(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 10), Movie(name: "Lorem ipsum8", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 8), Movie(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 9)]
    
    var body: some View {
        
        TitleListView(movies: ContentView.items)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

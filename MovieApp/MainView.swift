//
//  ContentView.swift
//  MovieApp
//
//  Created by Desu Miko on 27.02.2021.
//

import SwiftUI

struct TabItem: Identifiable {
    let text: String
    let image: (name: String, isSystem: Bool)
    let id: Int
    let destinationView: AnyView
    private static var itemsQuantity = 0

    init(text: String, imageName: String, isImageSystem: Bool,
         destinationView: AnyView) {
        self.text = text
        self.image = (imageName, isImageSystem)
        self.id = Self.itemsQuantity
        self.destinationView = destinationView
        Self.itemsQuantity += 1
    }
}

struct TabIconView: View {
    private let tab: TabItem

    var body: some View {
        VStack {
            tab.destinationView
        }
        .tabItem {
            if tab.image.isSystem {
                Image(systemName: tab.image.name)
            } else {
                Image(tab.image.name)
            }
            
            Text(tab.text)
                .font(.footnote)
        }
    }

    init(tab: TabItem) {
        self.tab = tab
    }
}

struct MainView: View {
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color("bg"))
    }
    static let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu justo ullamcorper quam venenatis tincidunt. In hac habitasse platea dictumst. "

    static var items: [Movie] = [Movie(name: "Lorem ipsum1", description: text, director: "Miko pwnz", rating: 4.6, genres: ["Drama", "Comedy", "Romantic"], image: "poster", id: 1),
                                 Movie(name: "Lorem ipsum2", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 2),
                                 Movie(name: "Lorem ipsum3", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 3),
                                 Movie(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 4),
                                 Movie(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 5),
                                 Movie(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.8, genres: [], image: "poster", id: 7),
                                 Movie(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 6),
                                 Movie(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 10),
                                 Movie(name: "Lorem ipsum8", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 8),
                                 Movie(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 9)]

    private let tabs: [TabItem] = [.init(text: "Popular", imageName: "star", isImageSystem: true, destinationView: AnyView(TitleListView(movies: items))),
                                   .init(text: "Search", imageName: "magnifyingglass", isImageSystem: true, destinationView: AnyView(TitleListView(movies: items)))]

    var body: some View {

        TabView {
            ForEach(tabs) { tab in
                TabIconView(tab: tab)
            }
        }
        .background(Color("bg"))

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

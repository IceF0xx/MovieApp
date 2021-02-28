//
//  TitleList.swift
//  MovieApp
//
//  Created by Desu Miko on 28.02.2021.
//

import SwiftUI

struct TitleList: View {
    let movieTitles: [MovieTitle]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                Section(header: MenuNavbar()) {
                    ForEach(movieTitles) { movie in
                        MovieThumbnail(movie: movie)
                    }
                }
            }
            .overlay(
                HStack {
                    Image(systemName: "list.bullet")
                    Spacer()
                }
            )
            .frame(maxWidth: .infinity)
            .background(Color("bg").ignoresSafeArea())
        }
    }
    init(movies: [MovieTitle]) {
        movieTitles = movies
    }
}

struct MenuNavbar: View {
    var body: some View {
        HStack {
            Button(action: {
            }, label: {
                Image(systemName: "list.bullet")
                    .font(.title2)
            })
            
            Spacer()
           
        }
        .overlay(
            Text("Info")
                .font(.title2)
                .fontWeight(.semibold)
        )
        .padding()
        .foregroundColor(.white)
    }
}


struct TitleList_Previews: PreviewProvider {
    static let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu justo ullamcorper quam venenatis tincidunt. In hac habitasse platea dictumst. Integer sed lorem cursus, varius nisi sed, imperdiet tortor. Curabitur tristique ultrices urna, non ullamcorper erat. Ut sit amet orci nec justo faucibus euismod. Nullam nibh nulla, pharetra id tortor sit amet, cursus fringilla eros. Aenean porttitor augue mi, sit amet porta augue luctus in. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas"
    static var previews: some View {
            
            
        TitleList(movies: [
                    .init(name: "Naruto", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 1),
                           .init(name: "Naruto", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 1)])
    }
}

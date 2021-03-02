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
                LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders])  {
                    Section(header: MenuNavbar()) {
                        ForEach(movieTitles) { movie in
                            MovieThumbnail(movie: movie)
                        }
                    }
                }
            }
            .background(Color("bg").ignoresSafeArea())
            .navigationBarHidden(true)
        }
    }
    
    
    init(movies: [MovieTitle]) {
        movieTitles = movies
    }
}

struct MenuNavbar: View {
    // TODO: fix header
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: backgroundCornerRadius)
                .fill(Color.white.opacity(backgroundOpacity))
                .padding(.horizontal)
                
            HStack {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "list.bullet")
                        .font(.title2)
                })
                    .padding(.horizontal, itemsHorizontalPadding)
                
                Spacer()
                
                Text(navbarTitle)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal, itemsHorizontalPadding)
            }
            .padding()
            .foregroundColor(Color("bg"))
        }
    }
    // MARK: Drawning content
    let backgroundOpacity = 0.85
    let backgroundCornerRadius: CGFloat = 20
    let itemsHorizontalPadding: CGFloat = 15
    
    
    // MARK: Navbar Data
    let navbarTitle = "Popular"
}


struct TitleList_Previews: PreviewProvider {
    static let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu justo ullamcorper quam venenatis tincidunt. In hac habitasse platea dictumst. Integer sed lorem cursus, varius nisi sed, imperdiet tortor. Curabitur tristique ultrices urna, non ullamcorper erat. Ut sit amet orci nec justo faucibus euismod. Nullam nibh nulla, pharetra id tortor sit amet, cursus fringilla eros. Aenean porttitor augue mi, sit amet porta augue luctus in. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas"
    
    static let item = MovieTitle(name: "Lorem ipsum", description: text, director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 1)
    static var previews: some View {
        TitleList(movies: [item, item, item, item, item, item, item, item, item, item, item, item])
    }
}

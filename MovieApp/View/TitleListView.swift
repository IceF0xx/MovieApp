//
//  TitleList.swift
//  MovieApp
//
//  Created by Desu Miko on 28.02.2021.
//

import SwiftUI

struct TitleListView: View {
    @State private var showSidebar = false

    var body: some View {
        ZStack(alignment: .leading) {
            Color("bg").ignoresSafeArea()

            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: vStackSpacing) {
                        ForEach(movieTitles) { movie in
                            MovieThumbnail(movie: movie)
                                .disabled(showSidebar)
                                .opacity(mainBlockOpacity)
                        }
                        Spacer()
                    }
                }
                .disabled(showSidebar)
                .navigationBarTitle(navbarTitle)
                .navigationBarItems(leading: BurgerButton(action: { showSidebar.toggle() }) )
                .background(Color("bg").ignoresSafeArea())
            }

            Sidebar(show: $showSidebar)

        }

    }

    init(movies: [Movie]) {
        movieTitles = movies
    }

    let movieTitles: [Movie]

    // MARK: NavbarData
    let navbarTitle = "Popular"

    // MARK: Drawning content
    let vStackSpacing: CGFloat = 15
    var mainBlockOpacity: Double {
        showSidebar ? 0.55 : 1
    }

    var sideBarOffset: CGFloat {
        showSidebar ? 0 : -getRect().width
    }
}

struct BurgerButton: View {
    let action: () -> Void
    let animation: Animation = .linear
    let useAnimation = true

    var body: some View {
        Button(action: {
            if useAnimation {
                withAnimation(animation) {
                    action()
                }
            } else {
                action()

            }

        }, label: {
            Image(systemName: "line.horizontal.3")
                .foregroundColor(.white)
                .font(.title2)
                .frame(width: 70, height: 70, alignment: .leading)
        })
    }
}

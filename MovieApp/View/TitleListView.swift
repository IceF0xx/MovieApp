//
//  TitleList.swift
//  MovieApp
//
//  Created by Desu Miko on 28.02.2021.
//

import SwiftUI

struct TitleListView: View {
    @State private var showSidebar = false
    @State private var searchField = ""
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color("bg").ignoresSafeArea(.all)
            
            Sidebar()
            
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: vStackSpacing, pinnedViews: [.sectionFooters])  {
                        Section(footer: MenuNavbar(showSidebar: $showSidebar)) {
                            ForEach(movieTitles) { movie in
                                MovieThumbnail(movie: movie)
                                    .disabled(showSidebar)
                                    .opacity(mainBlockOpacity)
                            }
                        }
                    }
                }
                .navigationBarTitle(navbarTitle)
                .navigationBarItems(leading:
                    Button(action: {
                        withAnimation {
                            showSidebar.toggle()
                        }
                }, label: {
                    Image(systemName: "line.horizontal.3")
                        .foregroundColor(.white)
                        .font(.title2)
                        .frame(width: 70, height: 70, alignment: .leading)
                }))
                .background(Color("bg").ignoresSafeArea())
            }
            .offset(x: mainFrameXOffset)
            .onTapGesture {
                if showSidebar {
                    withAnimation {
                        showSidebar.toggle()
                    }
                }
            }
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
    
    var mainFrameXOffset: CGFloat {
        showSidebar ? getRect().width / 1.8 : 0
    }
}


struct MenuNavbar: View {
    @Binding var showSidebar: Bool
    @State private var isSearchEditing = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: backgroundCornerRadius)
                .fill(Color.white.opacity(backgroundOpacity))
                .padding(.horizontal)
            
            
            HStack {
                Button(action: {
                    withAnimation {
                        showSidebar.toggle()
                    }
                }, label: {
                    Image(systemName: "list.bullet")
                        .font(.title2)
                })
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
}


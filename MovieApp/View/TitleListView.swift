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
            Color("bg").ignoresSafeArea(.all)
            
            Sidebar()
            
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: vStackSpacing, pinnedViews: [.sectionFooters]) {
                        Section {
                            ForEach(movieTitles) { movie in
                                MovieThumbnail(movie: movie)
                                    .disabled(showSidebar)
                                    .opacity(mainBlockOpacity)
                            }
                            Spacer(minLength: getRect().height / 15)
                        }
                    }
                }
                .disabled(showSidebar)
                .navigationBarTitle(navbarTitle)
                .navigationBarItems(leading:
                    Button(action: {
                        withAnimation {
                            showSidebar.toggle()
                            print("toggled")
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
                // Back from Sidebar to MainView
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


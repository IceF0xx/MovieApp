//
//  MovieThumbnail.swift
//  MovieApp
//
//  Created by Desu Miko on 28.02.2021.
//

import SwiftUI

struct MovieThumbnail: View {
    let movie: MovieTitle
    
    var body: some View {
        NavigationLink(destination: MovieView()) {
            
            HStack(spacing: 20) {
                Image("poster")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(movie.name)")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text("\(movie.rating, specifier: "%0.1f")")
                            .foregroundColor(.white)
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    
                    
                    Text(movie.description)
                        .foregroundColor(.white)
                        .font(.caption)
                        .padding(.vertical, 5)
                }
                
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: getRect().width / 3)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white)
            )
            .padding(.horizontal)
        }
        .navigationBarHidden(true)
        
    }
}

struct MovieThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("bg").ignoresSafeArea()
            MovieThumbnail(movie: .init(name: "Rascal Does Not Dream of a dreaming girl", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu justo ullamcorper quam venenatis tincidunt. In hac habitasse platea dictumst. Integer sed lorem cursus, varius nisi sed, imperdiet tortor. Curabitur tristique ultrices urna, non ullamcorper erat. Ut sit amet orci nec justo faucibus euismod. Nullam nibh nulla, pharetra id tortor sit amet, cursus fringilla eros. Aenean porttitor augue mi, sit amet porta augue luctus in. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas", director: "Miko pwnz", rating: 4.6, genres: [""], image: "poster", id: 1))
        }
    }
}

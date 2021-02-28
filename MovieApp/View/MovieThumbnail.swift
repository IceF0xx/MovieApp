//
//  MovieThumbnail.swift
//  MovieApp
//
//  Created by Desu Miko on 28.02.2021.
//

import SwiftUI

struct MovieThumbnail: View {
    let name = "Some name"
    var body: some View {
        NavigationLink(destination: MovieView()) {
            VStack {
                
                Image("poster")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                
                Text(name)
                    .font(.title2)
                    .foregroundColor(.white)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white)
            )
            .padding(5)
            .frame(maxWidth: getRect().width / 2.2)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct MovieThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        MovieThumbnail()
    }
}

//
//  MovieThumbnail.swift
//  MovieApp
//
//  Created by Desu Miko on 28.02.2021.
//

import SwiftUI

struct MovieThumbnail: View {
    let movie: Movie

    var body: some View {
        NavigationLink(destination: MovieView(movie: movie)) {

            HStack(spacing: cardHorizontalSpacing) {
                Image(movie.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(imageCornerRadius)

                VStack(alignment: .leading) {
                    Spacer()

                    HStack {
                        Text("\(movie.name)")
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.semibold)

                        Spacer()

                        Text("\(movie.rating, specifier: "%0.1f")")
                            .foregroundColor(.white)

                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }

                    Text(movie.description)
                        .foregroundColor(.white)
                        .font(.caption)
                        .padding(.vertical, verticalDescriptionPadding)
                }

                Spacer()

            }
            .frame(maxWidth: .infinity, maxHeight: getRect().width / 3)
            .overlay(
                RoundedRectangle(cornerRadius: cardCornerRadius)
                    .stroke(Color.white)
            )
            .padding(.horizontal)
        }
    }

    // MARK: Drawing content

    let cardCornerRadius: CGFloat = 15
    let imageCornerRadius: CGFloat = 15
    let cardHorizontalSpacing: CGFloat = 20
    let verticalDescriptionPadding: CGFloat = 5
}

struct MovieThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("bg").ignoresSafeArea()
            MovieThumbnail(movie: .init(name: "Rascal Does Not Dream of a dreaming girl",
                                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu justo ullamcorper quam venenatis tincidunt. ",
                                        director: "Miko pwnz", rating: 4.6,
                                        genres: [""], image: "poster", id: 1))
        }
    }
}

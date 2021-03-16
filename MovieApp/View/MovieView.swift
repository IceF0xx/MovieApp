//
//  HOme.swift
//  CinemaBookApp
//
//  Created by Desu Miko on 26.02.2021.
//

import SwiftUI

struct MovieView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: vStackSpacing, pinnedViews: [.sectionHeaders]) {

                Section(header: NavbarView(presentationMode: presentationMode)) {

                    PosterView()

                    MovieInfoView(movie)
                }
            }
        }
        .background(Color("bg").ignoresSafeArea())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)

    }

    // MARK: Drawning content

    let vStackSpacing: CGFloat = 10

    // MARK: Movie data

    let movie: Movie
}

struct NavbarView: View {
    @Binding var presentationMode: PresentationMode

    var body: some View {
        HStack {
            Button(action: {
                // going back to TitleList View
                $presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.title2)
            })

            Spacer()

            Button(action: addBookmark, label: {
                Image(systemName: bookmarkImage)
                    .font(.title2)
            })
        }
        .overlay(
            Text("Info")
                .font(.title2)
                .fontWeight(.semibold)
        )
        .padding()
        .foregroundColor(.white)
    }

    func addBookmark() {
        if isBookmarked {
            bookmarkImage = "bookmark"
        } else {
            bookmarkImage = "bookmark.fill"
        }

        successVibration()
        isBookmarked.toggle()
    }

    @State private var isBookmarked = false
    @State private var bookmarkImage = "bookmark"
}

struct PosterView: View {
    var body: some View {
        ZStack {
            // bottom shadow
            RoundedRectangle(cornerRadius: posterCornerRadius)
                .fill(Color.white.opacity(shadowOpacity))
                .padding(.horizontal)
                .offset(y: yShadowOffset)

            Image(movieName)
                .resizable()
                .scaledToFill()
                .cornerRadius(posterCornerRadius)

        }
        .frame(width: getRect().width / 1.5,
               height: getRect().height / 2)
        .padding(.top, 20)
    }

    // MARK: Drawing content

    let yShadowOffset: CGFloat = 8
    let shadowOpacity = 0.2
    let posterCornerRadius: CGFloat = 15

    // MARK: Poster data

    let movieName = "poster"
}

struct MovieInfoView: View {
    let movie: Movie

    init(_ movie: Movie) {
        self.movie = movie
    }

    var body: some View {
        VStack(alignment: .leading, spacing: vStackSpacing) {
            Text(movie.name)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)

            HStack {
                Text("Director: \(movie.director) | \(movie.rating, specifier: "%0.1f")")
                    .foregroundColor(.white)

                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .padding(.leading, starImagePadding)
                    .offset(y: starImageOffset)
            }
        }
        .padding(.top, descriptionBlockPaddingTop)
        .padding(.horizontal)
        .padding(.leading)
        .frame(maxWidth: .infinity, alignment: .leading)

        DescriptionView(movie)
            .padding(.horizontal, descriptionBlockPaddingHorizontal)

    }

    // MARK: Drawing content

    let vStackSpacing: CGFloat = 15
    let starImageOffset: CGFloat = -1
    let starImagePadding: CGFloat = 5
    let descriptionBlockPaddingTop: CGFloat = 35
    let descriptionBlockPaddingHorizontal: CGFloat = 30
}

struct DescriptionView: View {
    let movie: Movie

    init(_ movie: Movie) {
        self.movie = movie
    }

    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: minimumGenresWidth), alignment: .leading)]) {
            ForEach(movie.genres, id: \.self) { genre in
                Text(genre)
                    .font(.footnote)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.white.opacity(genreButtonBackgroundOpacity))
                    .clipShape(Capsule())

            }
        }

        Text(descriptionHeader)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(.vertical)
            .frame(maxWidth: .infinity, alignment: .leading)

        Text(movie.description)
            .foregroundColor(.white)
    }

    // MARK: Description data

    let descriptionHeader = "Synopsis"

    // MARK: Drawing content

    let genreButtonBackgroundOpacity = 0.08
    let minimumGenresWidth: CGFloat = 70
}

struct FooterButton: View {
    var body: some View {
        Button(action: {

        }, label: {
            Text(buttonText)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: getRect().width / 2)
                .background(Color("followButton"))
                .cornerRadius(cornerRadius)
        })
        .shadow(color: Color.white.opacity(shadowOpacity), radius: shadowRadius)
    }
    // MARK: Drawing content

    let cornerRadius: CGFloat = 15
    let shadowRadius: CGFloat = 15
    let shadowOpacity = 0.35
    let buttonText = "Follow"

}

struct Home_Previews: PreviewProvider {
    static let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu justo ullamcorper quam venenatis tincidunt. In hac habitasse platea dictumst.  "

    static var previews: some View {
        MovieView(movie: Movie(name: "Lorem ipsum", description: text,
                               director: "Miko pwnz", rating: 4.6,
                               genres: ["Adventure", "Drama", "Tradegy"],
                               image: "poster", id: 1))
    }
}

extension View {
    func getRect() -> CGRect {
        UIScreen.main.bounds
    }
}

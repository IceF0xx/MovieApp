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
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()

                        }
                    
                    MovieInfoView(name: movieName,
                                  director: movieDirector,
                                  rating: movieRating,
                                  description: movieDescription,
                                  genres: movieGenres)
                }
            }
             
        }
        .background(Color("bg").ignoresSafeArea())
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    // MARK: Drawning content
    
    let vStackSpacing: CGFloat = 10
    
    // MARK: Movie data
        
    let movieName = "Rascal Does Not Dream of a dreaming girl"
    let movieDirector = "Hajime Kamoshida"
    let movieRating = 4.5
    let movieDescription = ""
    let movieGenres = [""]
}

struct NavbarView: View {
    @Binding var presentationMode: PresentationMode
    
    var body: some View {
        HStack {
            Button(action: {
                $presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.title2)
            })
            
            Spacer()
            
            Button(action: {
                followTitle()
            }, label: {
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
    
    func followTitle() {
        if isBookmarked {
            bookmarkImage = "bookmark"
        } else {
            bookmarkImage = "bookmark.fill"
        }
        
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
    let name: String
    let director: String
    let rating: Double
    let description: String
    let genres: [String]
    
    init(name: String, director: String, rating: Double, description: String, genres: [String]) {
        self.name = name
        self.director = director
        self.rating = rating
        self.description = description
        self.genres = genres
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: vStackSpacing) {
            Text(name)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            HStack {
                Text("Director: \(director) | \(rating, specifier: "%0.1f")")
                    .foregroundColor(.white)
                
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .padding(.leading, 5)
                    .offset(y: starImageOffset)
            }
        }
        .padding(.top, movieNamePadding)
        .padding(.horizontal)
        .padding(.leading)
        .frame(maxWidth: .infinity, alignment: .leading)
        
        // Description and genres View
        DescriptionView(description, genres: genres)
            .padding(.horizontal, 30)

    }
    
    // MARK: Drawing content
    
    let vStackSpacing: CGFloat = 15
    let movieNamePadding: CGFloat = 35
    let starImageOffset: CGFloat = -1
}


struct DescriptionView: View {
    let description: String
    let genres: [String]
    
    init(_ description: String, genres: [String]) {
        self.description = description
        self.genres = ["Drama", "Comedy", "Advanture", "Tragedy"]
    }
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: minimumGenresWidth), alignment: .leading)]) {
            ForEach(genres, id: \.self) { genre in
                Text(genre)
                    .font(.caption)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.white.opacity(genreBackgroundOpacity))
                    .clipShape(Capsule())
                
            }
        }
        
        Text("Synopsis")
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(.vertical)
            .frame(maxWidth: .infinity ,alignment: .leading)
        
        Text(description)
            .foregroundColor(.white)
    }
    
    // MARK: Drawing content

    let genreBackgroundOpacity = 0.08
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
        .shadow(color: Color.white.opacity(0.35), radius: 15)
    }
    // MARK: Drawing content

    let cornerRadius: CGFloat = 15
    let buttonText = "Follow"
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}


extension View {
    func getRect() -> CGRect {
        UIScreen.main.bounds
    }
}

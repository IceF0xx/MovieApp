//
//  TitleList.swift
//  MovieApp
//
//  Created by Desu Miko on 28.02.2021.
//

import SwiftUI

struct TitleList: View {
//    let movieTitles: [MovieTitle
    
    var body: some View {
        NavigationView {
            MovieThumbnail()
        }


    }
}

struct TitleList_Previews: PreviewProvider {
    static var previews: some View {
        TitleList()
    }
}

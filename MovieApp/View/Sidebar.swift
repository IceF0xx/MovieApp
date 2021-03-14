//
//  Sidebar.swift
//  MovieApp
//
//  Created by Desu Miko on 28.02.2021.
//

import SwiftUI


struct Sidebar: View {
    var body: some View {
        VStack(alignment: .leading, spacing: vStackSpacing) {
            Image(systemName: "circle")
                .resizable()
                .frame(width: avatarSize.width, height: avatarSize.height)
            Text("one")
            Text("one")
            
            Spacer()
        }
        .padding(.leading)
        .padding(.top)
    }
    
    // MARK: Drawning content
    
    let avatarSize: (width: CGFloat, height: CGFloat) = (65, 65)
    let vStackSpacing: CGFloat = 20
}



struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}


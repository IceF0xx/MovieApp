//
//  Sidebar.swift
//  MovieApp
//
//  Created by Desu Miko on 28.02.2021.
//

import SwiftUI

struct Sidebar: View {
    @Binding var show: Bool

    var body: some View {
        HStack {

            VStack(alignment: .leading, spacing: vStackSpacing) {
                Image("avatar")
                    .resizable()
                    .frame(width: avatarSize.width, height: avatarSize.height)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(lineWidth: 3))
                    .padding(.top, avatarTopPadding)

                Divider()

                ForEach(list, id: \.self) { text in
                    Text(text)
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Divider()
                }

                Spacer()

            }
            .padding()

            Spacer()

            Divider()
                .ignoresSafeArea()
        }
        .frame(width: getRect().width / 1.75)
        .background(Color("bg"))
        .foregroundColor(.white)
        .offset(x: show ? 0 : -getRect().width)
    }

    let list = ["Genres", "Author", "Year"]

    // MARK: Drawning content

    let avatarSize: (width: CGFloat, height: CGFloat) = (65, 65)
    let avatarTopPadding: CGFloat = 15
    let vStackSpacing: CGFloat = 20
}

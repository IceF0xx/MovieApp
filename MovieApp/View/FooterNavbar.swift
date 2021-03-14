//
//  BottomNavbar.swift
//  MovieApp
//
//  Created by Desu Miko on 15.03.2021.
//

import SwiftUI


struct FooterNavbar: View {
    @Binding var currentTab: Int
    var body: some View {
        ZStack {
            Color("bg").opacity(0).ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: backgroundCornerRadius)
                .fill(Color.white.opacity(backgroundOpacity))
                .padding(.horizontal)
            
            
            HStack {
                Button(action: {
                    currentTab = 0
                }) {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .padding(.horizontal, itemsHorizontalPadding)
                }
                
                Button(action: {
                    currentTab = 1
                }) {
                    Image(systemName: "circle.fill")
                        .font(.title2)
                        .padding(.horizontal, itemsHorizontalPadding)
                }
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


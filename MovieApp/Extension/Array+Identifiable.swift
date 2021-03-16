//
//  Array+Identifiable.swift
//  MovieApp
//
//  Created by Desu Miko on 28.02.2021.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count where self[index].id == matching.id {
            return index
        }
        return nil
    }
}

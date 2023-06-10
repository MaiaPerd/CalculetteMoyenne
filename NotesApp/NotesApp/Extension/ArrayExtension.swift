//
//  ArrayExtension.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 09/06/2023.
//

import Foundation

extension Array where Element: Equatable {
    func compare(to other: [Element]) -> Bool {
        self.count == other.count && self.allSatisfy({ elt in
            other.contains { otherElt in
                otherElt == elt
            }
        })
    }
}


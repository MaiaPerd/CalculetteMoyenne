//
//  MatiereExtension.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 26/05/2023.
//

import Foundation
import Model

extension Matiere {
    struct Data: Identifiable{
        public let id: UUID
        public var name: String
        public var coef: Int
        public var note: CGFloat
    }
    
    var data: Data{(Data(id: self.id, name: self.name, coef: self.coef, note: self.note.floatToCgFloat()))}
    
    mutating func update(data: Data){
        guard data.id == self.id else { return }
        self.name = data.name
        self.coef = data.coef
        self.note = data.note.cgFloatToFloat()
    }
}

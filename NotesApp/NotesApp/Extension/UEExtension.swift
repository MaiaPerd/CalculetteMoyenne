//
//  UEExtension.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 26/05/2023.
//

import Foundation
import Model

extension UE {
    struct Data: Identifiable{
        public let id: UUID
        public var name: String
        public var coef: Int
        public var moyenne: CGFloat
        public var nbUE: Int
        public var listeNotes: [Matiere.Data]
    }
    
    var data: Data{(Data(id: id, name: name, coef: coef, moyenne: moyenne.floatToCgFloat(), nbUE: nbUE, listeNotes: listeNotes.map({$0.data})))}
    
    mutating func update(data: Data){
        guard data.id == self.id else { return }
        self.name = data.name
        self.coef = data.coef
        self.nbUE = data.nbUE
        self.listeNotes = data.listeNotes.map({Matiere(id: $0.id, name: $0.name, coef: $0.coef, note: $0.note.cgFloatToFloat())})
    }
}

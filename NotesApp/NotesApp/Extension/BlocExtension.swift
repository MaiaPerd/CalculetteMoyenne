//
//  BlocExtension.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 29/05/2023.
//

import Foundation
import Model

extension Bloc {
    struct Data: Identifiable{
        public let id: UUID
        public var name: String
        public var moyenne: CGFloat
    }
    
    var data: Data{(Data(id: self.id, name: self.name, moyenne: self.moyenne.floatToCgFloat()))}
    
    mutating func update(data: Data){
        guard data.id == self.id else { return }
        self.name = data.name
    }
}

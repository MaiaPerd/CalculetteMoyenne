//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 24/05/2023.
//

import Foundation

public struct UE : Identifiable {
    public let id: UUID
    public var name: String
    public var nbUE: Int
    public var coef: Int
    public var moyenne: Float {
        return Calcul.moyennePonderee(lesNotes: listeNotes)
    }
    public var listeNotes: [Matiere]
    
    
    public init(id: UUID, name: String, nbUe: Int, coef: Int, listeNotes: [Matiere]){
        self.id = id
        self.coef = coef
        self.nbUE = nbUe
        self.name = name
        self.listeNotes = listeNotes
    }
    
    public init(name: String, nbUe: Int, coef: Int, listeNotes: [Matiere]){
        self.id = UUID()
        self.coef = coef
        self.nbUE = nbUe
        self.name = name
        self.listeNotes = listeNotes
    }
    
    
    public mutating func addNote(note: Matiere){
        self.listeNotes.append(note)
    }
   
}

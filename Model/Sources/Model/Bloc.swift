//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 26/05/2023.
//

import Foundation

public struct Bloc : Identifiable, Equatable {
    public let id: UUID
    public var name: String
    public var moyenne: Float {
        return Calcul.moyennePondereeBloc(lesNotes: listeUEs)
    }
    public var listeUEs: [UE]
    
    
    public init(id: UUID, name: String, lesUEs ues: [UE]){
        self.id = id
        self.name = name
        self.listeUEs = ues
    }
    
    public init(name: String, lesUEs ues: [UE]){
        self.id = UUID()
        self.name = name
        self.listeUEs = ues
    }
    
    public static func == (lhs: Bloc, rhs: Bloc) -> Bool {
          lhs.id == rhs.id
      }
}


//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 24/05/2023.
//

import Foundation

public struct Matiere : Identifiable {
    public let id: UUID
    public var name: String
    public var coef: Int
    public var note: Float
    
    
    public init(id: UUID, name: String, coef: Int, note: Float){
        self.id = id
        self.coef = coef
        self.name = name
        self.note = note
    }
    
    public init(name: String, coef: Int, note: Float){
        self.id = UUID()
        self.coef = coef
        self.name = name
        self.note = note
    }
    
}


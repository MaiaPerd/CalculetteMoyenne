//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 29/05/2023.
//

import Foundation

public struct Calcul : Codable {
    public static func moyennePonderee(lesNotes notes: [Matiere])-> Float {
        var coefTotal = 0
        var moyenne: Float = 0;
        notes.forEach{ note in
            coefTotal += note.coef
            moyenne += note.note * Float(note.coef)
        }
       return  moyenne / Float(coefTotal)
    }
    
    public static func moyennePondereeBloc(lesNotes notes: [UE])-> Float {
        var coefTotal = 0
        var moyenne: Float = 0;
        notes.forEach{ note in
            coefTotal += note.coef
            moyenne += note.moyenne * Float(note.coef)
        }
       return  moyenne / Float(coefTotal)
    }
}

//
//  UEStub.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 24/05/2023.
//

import Foundation
import Model

public class UEStub {
    
    public static func loadManager()->Manager{
        var manager = Manager();
        manager.load(ues: loadUEs(), blocs: loadBlocs())
        return manager
    }
    
    public static func loadUEs()->[UE]{
        var mesUEs: [UE] = []
        
        mesUEs.append(UE(name: "Génie logiciel", nbUe: 1, coef: 6, listeNotes: loadNotesUE1()))
        mesUEs.append(UE(name: "Systèmes et réseaux", nbUe: 2, coef: 6, listeNotes: loadNotesUE2()))
        mesUEs.append(UE(name: "Insertion Professionnelle", nbUe: 3, coef: 6, listeNotes: loadNotesUE3()))
        mesUEs.append(UE(name: "Technologies Mobiles 1", nbUe: 4, coef: 9, listeNotes: loadNotesUE4()))
        mesUEs.append(UE(name: "Technologies Mobiles 2", nbUe: 5, coef: 9, listeNotes: loadNotesUE5()))
        mesUEs.append(UE(name: "Projet", nbUe: 6, coef: 9, listeNotes: loadNotesUE6()))
        mesUEs.append(UE(name: "Stage", nbUe: 7, coef: 15, listeNotes: loadNotesUE7()))
 
        return mesUEs
    }
    
    public static func loadUEsProjetStage()->[UE]{
        var mesUEs: [UE] = []
        
        mesUEs.append(UE(name: "Projet", nbUe: 6, coef: 9, listeNotes: loadNotesUE6()))
        mesUEs.append(UE(name: "Stage", nbUe: 7, coef: 15, listeNotes: loadNotesUE7()))
 
        return mesUEs
    }
    
    public static func loadNotesUE1()->[Matiere]{
        var mesNotes: [Matiere] = []
        
        mesNotes.append(Matiere(name: "Processus de développement", coef: 4, note: 10.08))
        mesNotes.append(Matiere(name: "Programmation Objets", coef: 9, note: 11.86))
        mesNotes.append(Matiere(name: "Qualité de développpement", coef: 5, note: 13.6))
        mesNotes.append(Matiere(name: "Remise à niveau objets", coef: 4, note: 11.75))
        
        return mesNotes
    }
    
    public static func loadNotesUE2()->[Matiere]{
        var mesNotes: [Matiere] = []
        
        mesNotes.append(Matiere(name: "Internet des Objets", coef: 4, note: 14))
        mesNotes.append(Matiere(name: "Réseaux", coef: 4, note: 3))
        mesNotes.append(Matiere(name: "Services Mobiles", coef: 4, note: 10))
        mesNotes.append(Matiere(name: "Système", coef: 5, note: 9.25))
        
        return mesNotes
    }
    
    public static func loadNotesUE3()->[Matiere]{
        var mesNotes: [Matiere] = []
        
        mesNotes.append(Matiere(name: "Anglais", coef: 5, note: 6.53))
        mesNotes.append(Matiere(name: "Economie", coef: 4, note: 12.75))
        mesNotes.append(Matiere(name: "Gestion", coef: 3, note: 10))
        mesNotes.append(Matiere(name: "Communication", coef: 4, note: 12))
        
        return mesNotes
    }
    
    public static func loadNotesUE4()->[Matiere]{
        var mesNotes: [Matiere] = []
        
        mesNotes.append(Matiere(name: "Android", coef: 6, note: 5.75))
        mesNotes.append(Matiere(name: "Architecture de projets C# .NET (1)", coef: 5, note: 13))
        mesNotes.append(Matiere(name: "C++", coef: 4, note: 10.57))
        mesNotes.append(Matiere(name: "Swift", coef: 5, note: 14.1))
        
        return mesNotes
    }
    
    public static func loadNotesUE5()->[Matiere]{
        var mesNotes: [Matiere] = []
        
        mesNotes.append(Matiere(name: "Architecture de projets C# .NET (2)", coef: 9, note: 10))
        mesNotes.append(Matiere(name: "Client/Serveur", coef: 4, note: 11))
        mesNotes.append(Matiere(name: "iOS", coef: 5, note: 14))
        mesNotes.append(Matiere(name: "Multiplateformes", coef: 3, note: 12))
        mesNotes.append(Matiere(name: "QT Quick", coef: 5, note: 12))
        mesNotes.append(Matiere(name: "Xamarin", coef: 5, note: 12))
        
        return mesNotes
    }
    
    public static func loadNotesUE6()->[Matiere]{
        var mesNotes: [Matiere] = []
        
        mesNotes.append(Matiere(name: "Projet", coef: 1, note: 13.06))

        return mesNotes
    }
    
    public static func loadNotesUE7()->[Matiere]{
        var mesNotes: [Matiere] = []
        
        mesNotes.append(Matiere(name: "Stage", coef: 1, note: 14))
        
        return mesNotes
    }
    
    public static func loadBlocs()->[Bloc]{
        var mesBlocs: [Bloc] = []
        
        mesBlocs.append(Bloc(name: "Total", lesUEs: loadUEs()))
        mesBlocs.append(Bloc(name: "Projet/Stage", lesUEs: loadUEsProjetStage()))
        
        return mesBlocs
    }

}


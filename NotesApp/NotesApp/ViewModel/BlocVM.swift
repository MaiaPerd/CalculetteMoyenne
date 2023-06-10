//
//  BlocVM.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 26/05/2023.
//

import Foundation
import Model


public class BlocVM : ObservableObject, Identifiable, Equatable  {
    
    public static func == (lhs: BlocVM, rhs: BlocVM) -> Bool {
        lhs.id == rhs.id
    }
    
    public init(){}
    
    public init(model: Bloc){
        self.model = model
    }
    
    public var id: UUID { model.id }
    
    @Published
    var model: Bloc = Bloc(id: UUID(), name: "Total", lesUEs: []){
        didSet {
            if self.model.name != self.name {
                self.name = self.model.name
            }
            if self.model.moyenne != self.moyenne {
                self.moyenne = self.model.moyenne
            }
            if !self.model.listeUEs.compare(to: self.listeUEs.map({$0.model})){
                self.listeUEs = self.model.listeUEs.map({UEVM(model: $0)})
                self.listeUEs.forEach { uevm in
                    uevm.bloc = self
                }
             }
        }
    }
    
    @Published
    var name: String = "Total" {
        didSet{
            if self.model.name != self.name {
                self.model.name = self.name
            }
        }
    }
    
    @Published
    var moyenne: Float = 0
    
    @Published
    var listeUEs: [UEVM] = [] {
        didSet {
            let listeNotes = self.listeUEs.map({$0.model})
            if !self.model.listeUEs.compare(to: listeNotes){
                self.model.listeUEs = listeUEs.map({$0.model})
            }
        }
    }
    
   func update(from uevm: UEVM){
        self.objectWillChange.send()
   }
    
    
}

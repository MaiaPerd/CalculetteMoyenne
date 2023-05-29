//
//  UEVM.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 24/05/2023.
//

import Foundation
import Model


public class UEVM : ObservableObject  {
    public var original: UE
    @Published var isEdited = false
    @Published var model: UE.Data = UE.Data(id: UUID(),name: "Prod", coef: 1, moyenne: 10, nbUE: 1, listeNotes: [])
  
    
    public init(ue: UE){
        self.original = ue
        model = original.data
    }
    
    func onEditing(){
        model = original.data
        isEdited = true
    }
    
    func onEdited(isCancelled: Bool = false){
        if(!isCancelled){
            original.update(data: model)
        }
        isEdited = false
    }
}


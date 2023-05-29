//
//  MatiereVM.swift
//  MatieresApp
//
//  Created by Perderizet Maïa on 24/05/2023.
//

import Foundation
import Model

public class MatiereVM : ObservableObject  {
    public var original: Matiere
    @Published var isEdited = false
    @Published var model: Matiere.Data = Matiere.Data(id: UUID(), name: "Matiere", coef: 1, note: 10)
  
    
    public init(matiere: Matiere){
        self.original = matiere
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



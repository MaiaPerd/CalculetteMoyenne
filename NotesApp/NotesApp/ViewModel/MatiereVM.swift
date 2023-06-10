//
//  MatiereVM.swift
//  MatieresApp
//
//  Created by Perderizet Maïa on 24/05/2023.
//

import Foundation
import Model

/*
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
}*/

public class MatiereVM : ObservableObject, Identifiable, Equatable  {
 
    public static func == (lhs: MatiereVM, rhs: MatiereVM) -> Bool {
          lhs.id == rhs.id
      }
    
    public init(){}
    
    public init(model: Matiere){
           self.model = model
    }
    
    public var id: UUID { model.id }
    
    @Published
    var model: Matiere = Matiere(id: UUID(), name: "Matière", coef: 1, note: 10){
        didSet {
            if self.model.name != self.name {
                self.name = self.model.name
            }
            if self.model.coef != self.coef{
                self.coef = self.model.coef
            }
            if self.model.note != self.note {
                self.note = self.model.note
            }
            notifyPropertyChanged()
        }
    }
    
    @Published
    var name: String = "Matière" {
        didSet{
            if self.model.name != self.name {
                self.model.name = self.name
            }
        }
    }
    
    @Published
    var coef: Int = 1 {
        didSet{
            if self.model.coef != self.coef{
                self.model.coef = self.coef
            }
        }
    }
    
    @Published
    var note: Float = 10 {
        didSet{
            if self.model.note != self.note {
                self.model.note = self.note
            }
        }
    }
    
    @Published
    var isEditing: Bool = false
       
    func onEditing(){
        isEditing = true
    }
    
    func onEdited(){
        isEditing = false
    }
    /*
    @Published
    var isEditing: Bool = false
        
    private var copy: MatiereVM { MatiereVM(model: self.model) }
        
    var editedCopy: MatiereVM?
        
    func onEditing(){
        editedCopy = self.copy
        isEditing = true
    }
        
    func onEdited(isCancelled cancel: Bool = false) {
        if !cancel {
            if let editedCopy = editedCopy {
                self.model = editedCopy.model
            }
        }
        editedCopy = nil
        isEditing = false
    }
    */
    
    var ue: UEVM?
    
    private func notifyPropertyChanged(){
        ue?.update(from: self)
    }
}



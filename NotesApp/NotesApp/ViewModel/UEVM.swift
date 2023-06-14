//
//  UEVM.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 24/05/2023.
//

import Foundation
import Model

/*
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
    
    public func addNote(){
        original.addNote(note: Matiere(name: "Nouvelle note", coef: 0, note: 0))
    }
    
    public func deleteNote(note: Matiere) -> Bool{
        original.deleteNote(note: note)
    }
    
    public func updateNote(note: Matiere){
       
    }
   
}*/

//Solution 1
/*
public class UEVM : ObservableObject, Identifiable, Equatable  {
    
    public static func == (lhs: UEVM, rhs: UEVM) -> Bool {
        lhs.id == rhs.id && lhs.moyenne == rhs.moyenne
      }
    
    public init(){}

    public init(model: UE){
        self.model = model
    }
       
    public var id: UUID { model.id }
    
    @Published
    var model: UE = UE(id: UUID(), name: "Prod",  nbUe: 1, coef: 1, listeNotes: []){
        didSet {
            if self.model.name != self.name {
                self.name = self.model.name
            }
            if self.model.nbUE != self.nbUe {
                self.nbUe = self.model.nbUE
            }
            if self.model.coef != self.coef {
                self.coef = self.model.coef
            }
            if !self.model.listeNotes.compare(to: self.listeNotesVM.map({$0.model})){
                self.listeNotesVM = self.model.listeNotes.map({MatiereVM(model: $0)})
                self.listeNotesVM.forEach { mvm in
                    mvm.ue = self
                }
             }
            notifyPropertyChanged()
        }
    }
       
    @Published
    var name: String = "" {
        didSet{
            if self.model.name != self.name {
                self.model.name = self.name
            }
        }
    }
    
    @Published
    var nbUe: Int = 0 {
        didSet {
            if self.model.nbUE != self.nbUe {
                self.model.nbUE = self.nbUe
            }
        }
    }
    
    @Published
    var coef: Int = 0 {
        didSet {
            if self.model.coef != self.coef {
                self.model.coef = self.coef
            }
        }
    }
    
    var moyenne: Float {
        model.moyenne
    }
    
    @Published
    var listeNotesVM: [MatiereVM] = [] {
        didSet {
            let listeNotes = self.listeNotesVM.map({$0.model})
            if !self.model.listeNotes.compare(to: listeNotes){
                self.model.listeNotes = listeNotesVM.map({$0.model})
            }
        }
    }
    
    @Published
    var isEditing: Bool = false
        
    private var copy: UEVM { UEVM(model: self.model) }
        
    var editedCopy: UEVM?
        
    func onEditing(){
        editedCopy = self.copy
        isAdding = false
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
    
    public func addMatiere(){
        self.listeNotesVM.append(MatiereVM())
    }
    
    public func deleteMatiere(matiere: MatiereVM){
        if self.listeNotesVM.contains(matiere) {
            self.listeNotesVM.removeAll(where: {$0 == matiere})
        }
    }
    
    var addedItem: MatiereVM?
        
    @Published
    var isAdding: Bool = false
        
    func onAdding() {
        addedItem = MatiereVM()
        isEditing = false
        isAdding = true
    }
        
    func onAdded(isCancelled cancel:Bool = false) {
        if !cancel {
            if let addedItem = addedItem {
                self.listeNotesVM.append(addedItem)
            }
        }
        addedItem = nil
        isAdding = false
    }
    

       
    func onDeleted(_ matiere:MatiereVM, isCancelled cancel: Bool = false) {
        if !cancel {
            if self.listeNotesVM.contains(matiere) {
                self.listeNotesVM.removeAll(where: {$0 == matiere})
            }
        }
    }
    
    
    func update(from mvm: MatiereVM){
        if let index = self.model.listeNotes.firstIndex(where: {$0.id == mvm.model.id}){
                   self.model.listeNotes[index] = mvm.model
               }
        self.objectWillChange.send()
    }
    
    var bloc: BlocVM?
    
    private func notifyPropertyChanged(){
        bloc?.update(from: self)
    }
}
*/

//Solution 2
public class UEVM : ObservableObject, Identifiable, Equatable, Hashable  {
    
    public static func == (lhs: UEVM, rhs: UEVM) -> Bool {
        lhs.id == rhs.id && lhs.moyenne == rhs.moyenne
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    public init(){}
    
    public init(model: UE){
        self.model = model
    }
    
    public var id: UUID { model.id }
    
    @Published
    var model: UE = UE(id: UUID(), name: "Prod",  nbUe: 1, coef: 1, listeNotes: []){
        willSet(newValue) {
            if !self.listeNotesVM.map({$0.model}).compare(to: newValue.listeNotes){
                self.listeNotesVM.forEach { $0.unsubscribe(with: self) }
            }
        }
        didSet {
            if self.model.name != self.name {
                self.name = self.model.name
            }
            if self.model.nbUE != self.nbUe {
                self.nbUe = self.model.nbUE
            }
            if self.model.coef != self.coef {
                self.coef = self.model.coef
            }
            if !self.model.listeNotes.compare(to: self.listeNotesVM.map({$0.model})){
                self.listeNotesVM = self.model.listeNotes.map({MatiereVM(model: $0)})
                self.listeNotesVM.forEach { mvm in
                    mvm.subscribe(with: self, and: onNotifyChanged(source:))
                }
            }
            self.notifyChanged()
        }
    }
    
    @Published
    var name: String = "" {
        didSet{
            if self.model.name != self.name {
                self.model.name = self.name
            }
        }
    }
    
    @Published
    var nbUe: Int = 0 {
        didSet {
            if self.model.nbUE != self.nbUe {
                self.model.nbUE = self.nbUe
            }
        }
    }
    
    @Published
    var coef: Int = 0 {
        didSet {
            if self.model.coef != self.coef {
                self.model.coef = self.coef
            }
        }
    }
    
    var moyenne: Float {
        model.moyenne
    }
    
    @Published
    var listeNotesVM: [MatiereVM] = [] {
        didSet {
            let listeNotes = self.listeNotesVM.map({$0.model})
            if !self.model.listeNotes.compare(to: listeNotes){
                self.model.listeNotes = listeNotesVM.map({$0.model})
            }
        }
    }
    
    @Published
    var isEditing: Bool = false
    
    private var copy: UEVM { UEVM(model: self.model) }
    
    var editedCopy: UEVM?
    
    func onEditing(){
        editedCopy = self.copy
        isAdding = false
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
    
    public func addMatiere(){
        var matiere = MatiereVM()
        self.listeNotesVM.append(matiere)
        matiere.subscribe(with: self, and: onNotifyChanged(source:))
    }
    
    public func deleteMatiere(matiere: MatiereVM){
        if self.listeNotesVM.contains(matiere) {
            self.listeNotesVM.removeAll(where: {$0 == matiere})
        }
    }
    
    var addedItem: MatiereVM?
    
    @Published
    var isAdding: Bool = false
    
    func onAdding() {
        addedItem = MatiereVM()
        isEditing = false
        isAdding = true
    }
    
    func onAdded(isCancelled cancel:Bool = false) {
        if !cancel {
            if let addedItem = addedItem {
                self.listeNotesVM.append(addedItem)
                addedItem.subscribe(with: self, and: onNotifyChanged(source:))
            }
        }
        addedItem = nil
        isAdding = false
    }
    
    
    
    func onDeleted(_ matiere:MatiereVM, isCancelled cancel: Bool = false) {
        if !cancel {
            if self.listeNotesVM.contains(matiere) {
                self.listeNotesVM.filter { $0 == matiere }
                    .forEach { $0.unsubscribe(with: self) }
                self.listeNotesVM.removeAll(where: {$0 == matiere})
            }
        }
    }
    
    
    func onNotifyChanged(source:MatiereVM){
        if let index = self.model.listeNotes.firstIndex(where: {$0.id == source.model.id}){
            self.model.listeNotes[index] = source.model
        }
        self.objectWillChange.send()
    }

    private var updateFuncs: [AnyHashable:(UEVM) -> ()] = [:]

    public func subscribe(with obj: AnyHashable, and function:@escaping (UEVM) -> ()) {
        updateFuncs[obj] = function
    }

    public func unsubscribe(with obj: AnyHashable) {
        updateFuncs.removeValue(forKey: obj)
    }

    private func notifyChanged(){
        for f in updateFuncs.values {
            f(self)
        }
    }
}

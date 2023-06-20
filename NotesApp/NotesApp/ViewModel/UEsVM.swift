//
//  UEsVM.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 24/05/2023.
//

import Foundation
import Model
/*
public class UEsVM : ObservableObject  {
    @Published var allUEs: [UE]
    public var blocs: [Bloc]
    
    public init(ues: [UE], blocs: [Bloc]){
        self.allUEs = ues
        self.blocs = blocs
    }
    
    func update(UEVM: UEVM){
        if let i = allUEs.firstIndex(where: {$0.id == UEVM.original.id}){
            allUEs[i] = UEVM.original
        }
        else{
            allUEs.append(UEVM.original)
        }
    }
    
}*/
/*
public class UEsVM : ObservableObject  {
    @Published var allUEs: [UEVM]
    public var blocs: [Bloc]
    
    public init(ues: [UE], blocs: [Bloc]){
        self.allUEs = ues.map({UEVM(ue: $0)})
        self.blocs = blocs
    }
    
    func update(UEVM: UEVM){
        if let i = allUEs.firstIndex(where: {$0.original.id == UEVM.original.id}){
            allUEs[i] = UEVM
        }
        else{
            allUEs.append(UEVM)
        }
    }
    
}*/

public class UEsVM : ObservableObject, Hashable  {
    public static func == (lhs: UEsVM, rhs: UEsVM) -> Bool {
        lhs.allUEs.compare(to: rhs.allUEs)
    }
    
    @Published var allUEs: [UEVM] = []
    public var blocs: [BlocVM]
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine("ues")
    }
    
    public init(ues: [UE], blocs: [Bloc]){
        self.allUEs = ues.map({UEVM(model: $0)})
        self.blocs = blocs.map({BlocVM(model: $0)})
        self.allUEs.forEach { uevm in
            uevm.subscribe(with: self, and: onNotifyChanged(source:))
        }
    }
    
    public init(ues: [UEVM], blocs: [BlocVM]){
        self.allUEs = ues
        self.blocs = blocs
        self.allUEs.forEach { uevm in
            uevm.subscribe(with: self, and: onNotifyChanged(source:))
        }
    }
    
    func onNotifyChanged(source:UEVM){
        self.blocs.forEach{ bloc in
            if let index = bloc.listeUEs.firstIndex(where: {$0.nbUe == source.model.nbUE}){
                bloc.listeUEs[index].model = source.model
            }
        }
       
        self.objectWillChange.send()
    }
    
    
}

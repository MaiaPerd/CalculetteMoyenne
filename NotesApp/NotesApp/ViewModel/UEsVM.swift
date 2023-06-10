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

public class UEsVM : ObservableObject  {
    @Published var allUEs: [UEVM] = []
    public var blocs: [BlocVM]
    
    public init(ues: [UE], blocs: [Bloc]){
        self.allUEs = ues.map({UEVM(model: $0)})
        self.blocs = blocs.map({BlocVM(model: $0)})
    }
    
    public init(ues: [UEVM], blocs: [BlocVM]){
        self.allUEs = ues
        self.blocs = blocs
    }
    
    
}

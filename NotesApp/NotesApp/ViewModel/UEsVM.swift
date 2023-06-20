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
    public func load() async throws  {
        let load: ([UE], [Bloc]) = try await persistance.load()
        self.allUEs = load.0.map({UEVM(model: $0)})
        self.blocs = load.1.map({BlocVM(model: $0)})
        self.allUEs.forEach { uevm in
            uevm.subscribe(with: self, and: onNotifyChanged(source:))
        }
    }
    
    public func save() async throws {
        try await persistance.save(withUEs: allUEs.map { $0.model }, withBlocs: blocs.map { $0.model })
    }
    
    public static func == (lhs: UEsVM, rhs: UEsVM) -> Bool {
        lhs.allUEs.compare(to: rhs.allUEs)
    }
    
    @Published var allUEs: [UEVM] = []
    public var blocs: [BlocVM] = []
    var persistance: JsonPersistance
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine("ues")
    }
    
    /*public init(ues: [UE], blocs: [Bloc]){
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
    }*/
    
    public init(withPersitance persistance: JsonPersistance) {
        self.allUEs = []
        self.blocs = []
        self.persistance = persistance
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

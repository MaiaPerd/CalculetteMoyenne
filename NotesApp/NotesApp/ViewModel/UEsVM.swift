//
//  UEsVM.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 24/05/2023.
//

import Foundation
import Model

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
    
}


//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 09/06/2023.
//

import Foundation
/*
public struct Manager : Codable {
    let dataManager: DataManager
    public var ues: [UE] = []
    public var blocs: [Bloc] = []
    
    public init(withDataManager dataManager: DataManager){
        self.dataManager = dataManager
    }
    
    public mutating func load() {
        self.ues.removeAll()
        for ue in self.dataManager.load() {
            self.ues.append(ue)
        }
    }
    
    public func saveUEs() {
        self.dataManager.save(ues:self.ues)
    }
}*/


public struct Manager : Codable {
    public var ues: [UE] = []
    public var blocs: [Bloc] = []
    
    public init(){
    }
    
    public mutating func load(ues: [UE], blocs: [Bloc]) {
        self.ues.removeAll()
        for ue in ues {
            self.ues.append(ue)
        }
        self.blocs.removeAll()
        for bloc in blocs {
            self.blocs.append(bloc)
        }
    }
  
}

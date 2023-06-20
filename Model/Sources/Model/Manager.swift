//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 09/06/2023.
//

import Foundation

public struct Manager  {
    let dataManager: DataManager
    public var ues: [UE] = []
    
    public init(withDataManager dataManager: DataManager){
        self.dataManager = dataManager
    }
    
    public mutating func loadEUs() {
        self.ues.removeAll()
        for ue in self.dataManager.loadUEs() {
            self.ues.append(ue)
        }
    }
    
    public func saveUEs() {
        self.dataManager.save(ues:self.ues)
    }
}

//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 09/06/2023.
//

import Foundation

public protocol DataManager  {
    func loadUEs() -> [UE]
    func save(ues: [UE])
}

//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 09/06/2023.
//

import Foundation

@available(iOS 13.0.0, *)
public protocol DataManager {
    func load() async throws -> ([UE], [Bloc])
    func save(withUEs ues: [UE], withBlocs blocs: [Bloc]) async throws
}

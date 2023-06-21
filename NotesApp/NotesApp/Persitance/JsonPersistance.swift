//
//  JsonPersistance.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 20/06/2023.
//

import Foundation
import Model

public class JsonPersistance : DataManager {
   
    private static let path = "calculette.data"

    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent(path)
    }
    
    public func load() async throws -> ([Model.UE], [Model.Bloc]) {
        let task = Task<DailyData, Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return DailyData(ues: UEStub.loadUEs(), blocs: UEStub.loadBlocs())
            }
            let dailyScrums = try JSONDecoder().decode(DailyData.self, from: data)
            return dailyScrums
        }
        let result: DailyData = try await task.value
        return (result.ues, result.blocs)
    }
    
    public func save(withUEs ues: [Model.UE], withBlocs blocs: [Model.Bloc]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(DailyData(ues: ues, blocs: blocs))
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        try await task.value
    }
    
}

struct DailyData: Codable {
    let ues: [UE]
    let blocs: [Bloc]
}

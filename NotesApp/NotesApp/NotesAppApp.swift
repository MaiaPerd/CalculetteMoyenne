//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 23/05/2023.
//

import SwiftUI

@main
struct NotesAppApp: App {
    @StateObject private var store = UEsVM(withPersitance: JsonPersistance())

    var body: some Scene {
           WindowGroup {
               CalculetteView(uesVM: store){
                   Task {
                       do {
                           try await store.save()
                       } catch {
                           fatalError(error.localizedDescription)
                       }
                   }
               }
                   .task {
                       do {
                           try await store.load()
                       } catch {
                           fatalError(error.localizedDescription)
                       }
                   }
           }
       }
}

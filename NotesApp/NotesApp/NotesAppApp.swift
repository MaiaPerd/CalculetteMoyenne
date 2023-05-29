//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 23/05/2023.
//

import SwiftUI

@main
struct NotesAppApp: App {
    @StateObject var UEs: UEsVM = UEsVM(ues: UEStub.loadUEs(), blocs: UEStub.loadBlocs())
    
    var body: some Scene {
        WindowGroup {
            CalculetteView(uesVM: UEs)
        }
    }
}

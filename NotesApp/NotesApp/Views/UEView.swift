//
//  UEView.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 26/05/2023.
//

import SwiftUI

struct UEView: View {
    @ObservedObject var ue: UEVM
    var isText: Bool
    
    var body: some View {
        VStack(alignment: .leading){
            UECalculetteView(ue: ue, isDetail: true)
            Divider()
            Label("coefficient: \(ue.coef)", systemImage: "xmark.circle.fill").padding()
            Divider()
            VStack(alignment: .leading){
               
                Label("Détails des notes", systemImage: "note.text").font(.title2).padding(.vertical)
                ForEach($ue.listeNotesVM){ $note in
                    NoteView(matiere: note, isText: isText)
                    Divider().padding(.leading, 10)
                }
            }.padding(.horizontal)
        }.navigationTitle("UE\($ue.nbUe.wrappedValue) \(ue.name)")
        .accentColor(.red)
    }
}

struct UEView_Previews: PreviewProvider {
    static var previews: some View {
        UEView(ue: UEVM(model: UEStub.loadUEs().first!), isText: true)
    }
}

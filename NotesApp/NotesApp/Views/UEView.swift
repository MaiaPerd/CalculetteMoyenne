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
            Label("coefficient: \(ue.model.coef)", systemImage: "xmark.circle.fill").padding()
            Divider()
            VStack(alignment: .leading){
               
                Label("Détails des notes", systemImage: "note.text").font(.title2).padding(.vertical)
                ForEach(ue.original.listeNotes){ note in
                    NoteView(matiere: MatiereVM(matiere: note), isText: isText)
                }
                Divider().padding(.leading, 10)
            }.padding(.horizontal)
        }
        .accentColor(.red)
    }
}

struct UEView_Previews: PreviewProvider {
    static var previews: some View {
        UEView(ue: UEVM(ue: UEsVM(ues: UEStub.loadUEs(),  blocs: UEStub.loadBlocs()).allUEs[0]), isText: true)
    }
}

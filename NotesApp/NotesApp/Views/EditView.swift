//
//  EditView.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 23/05/2023.
//

import SwiftUI

struct EditView: View {
    @ObservedObject var ue: UEVM
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        HStack{
                            Text("UE")
                            TextField("\(ue.model.nbUE)", value: $ue.model.nbUE, formatter: NumberFormatter()).frame(width: 16)
                            TextField(ue.model.name, text: $ue.model.name).padding(.horizontal, 4)
                            Spacer()
                        }
                        HStack{
                            Capsule().frame(width: ue.model.moyenne*10, height: 10).foregroundColor(getCapsuleColor())
                            Text(String(format: "%.2f", ue.model.moyenne))
                        }
                    }.padding(.horizontal)
                    Divider()
                    HStack{
                        Label("coefficient: ", systemImage: "xmark.circle.fill")
                        TextField("\(ue.model.coef)", value: $ue.model.coef, formatter: NumberFormatter())
                    }.padding()
                    Divider()
                    VStack(alignment: .leading){
                        Label("Détails des notes", systemImage: "note.text").font(.title2).padding(.vertical)
                        ForEach(ue.original.listeNotes){ note in
                            HStack{
                                NoteView(matiere: MatiereVM(matiere: note), isText: false)
                                Button(action: {ue.original.deleteNote(note: note)}){
                                    Image(systemName: "delete.left.fill")
                                }.padding()
                            }
                            Divider().padding(.leading, 10)
                        }.onDelete(perform: deleteItems)
                       
                    }.padding(.horizontal)
                }
                .toolbar{
                    ToolbarItem(placement: .cancellationAction){
                        Button(action: {ue.onEdited()}){
                            Image(systemName: "xmark")
                        }
                }
                    ToolbarItem(placement: .confirmationAction){
                        Button(action: {ue.onEdited(isCancelled: true)}){
                            Image(systemName: "checkmark")
                        }
                }
            }.accentColor(.red)
               
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        ue.original.listeNotes.remove(atOffsets: offsets)
    }
    
    private func getCapsuleColor() -> Color{
        if ue.model.moyenne > 10 {
            return .red
        }
        return .green
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(ue:  UEVM(ue: UEsVM(ues: UEStub.loadUEs(), blocs: UEStub.loadBlocs()).allUEs[0]))
    }
}

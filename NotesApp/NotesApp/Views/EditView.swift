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
            ScrollView{
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        HStack{
                            Text("UE")
                            TextField("\(ue.nbUe)", value: $ue.nbUe, formatter: NumberFormatter()).frame(width: 16)
                            TextField(ue.name, text: $ue.name).padding(.horizontal, 4)
                            Spacer()
                        }
                        HStack{
                            Capsule().frame(width: CGFloat(ue.moyenne)*10, height: 10).foregroundColor(getCapsuleColor())
                            Text(String(format: "%.2f", ue.moyenne))
                        }
                    }.padding(.horizontal)
                    Divider()
                    HStack{
                        Label("coefficient: ", systemImage: "xmark.circle.fill")
                        TextField("\(ue.coef)", value: $ue.coef, formatter: NumberFormatter())
                    }.padding()
                    Divider()
                    VStack(alignment: .leading){
                        HStack{
                            Label("Détails des notes", systemImage: "note.text").font(.title2).padding(.vertical)
                            Spacer()
                            Button(action: {ue.addMatiere()}){
                                Image(systemName: "plus").foregroundColor(.white).padding(5)
                            }.background(.red).cornerRadius(4)
                        
                        }
                        ForEach(ue.listeNotesVM){note in
                            HStack{
                                NoteView(matiere: note, isText: false)
                                Button(action: {
                                    ue.deleteMatiere(matiere: note)
                                }){
                                    Image(systemName: "delete.left.fill")
                                }.padding()
                            }
                            Divider().padding(.leading, 10)
                        }
                       
                    }.padding(.horizontal)
                }
          .accentColor(.red)
               
            }
        
    }
    
    private func getCapsuleColor() -> Color{
        if ue.moyenne > 10 {
            return .red
        }
        return .green
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(ue:  UEVM(model: UEStub.loadUEs().first!))
    }
}

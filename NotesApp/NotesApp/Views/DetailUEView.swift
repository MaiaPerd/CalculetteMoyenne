//
//  DetailUEView.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 23/05/2023.
//

import SwiftUI

struct DetailUEView: View {
    @ObservedObject var ue: UEVM
    
    var body: some View {
        ScrollView{
            UEView(ue: ue, isText: true).toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: ue.onEditing){
                        Text("Edit")
                    }
                }
               /* ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: ue.onAdding){
                        Text("Add")
                    }
                }*/
            }.sheet(isPresented: $ue.isEditing){
                NavigationStack{
                    EditView(ue: ue.editedCopy!)
                        .toolbar{
                            ToolbarItem(placement: .cancellationAction){
                                Button(action: {ue.onEdited(isCancelled: true)}){
                                    Image(systemName: "xmark")
                                }
                            }
                            ToolbarItem(placement: .confirmationAction){
                                Button(action: {
                                    ue.onEdited()}){
                                        Image(systemName: "checkmark")
                                    }
                            }
                        }
                }.accentColor(.red)
            }.sheet(isPresented: $ue.isAdding){
                NavigationStack{
                    NoteView(matiere: ue.addedItem!, isText: false)
                        .toolbar{
                            ToolbarItem(id: "add", placement: .confirmationAction){
                                Button(action: {
                                    self.ue.onAdded()
                                }){
                                    Text("Add")
                                }
                            }
                            ToolbarItem(id: "cancel", placement: .cancellationAction){
                                Button(action: {
                                    self.ue.onAdded(isCancelled:true)
                                }){
                                    Text("Cancel")
                                }
                            }
                        }
                        .navigationBarTitle("Ajouter une matière")
                }.accentColor(.red)
            }
        }.accentColor(.red)
    }
}

struct DetailUEView_Previews: PreviewProvider {
    static var previews: some View {
        DetailUEView(ue: UEVM(model: UEStub.loadUEs().first!))
    }
}

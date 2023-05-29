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
            }.sheet(isPresented: $ue.isEdited){
                EditView(ue: ue)
            }
        }.accentColor(.red)
    }
}

struct DetailUEView_Previews: PreviewProvider {
    static var previews: some View {
        DetailUEView(ue: UEVM(ue: UEsVM(ues: UEStub.loadUEs(), blocs: UEStub.loadBlocs()).allUEs[0]))
    }
}

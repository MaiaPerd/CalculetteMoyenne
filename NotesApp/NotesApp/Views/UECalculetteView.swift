//
//  UECaluletteView.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 23/05/2023.
//

import SwiftUI

struct UECalculetteView: View {
    @ObservedObject var ue: UEVM
    var isDetail: Bool
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                HStack{
                    Text("UE\(ue.model.nbUE) \(ue.model.name)").padding(.horizontal, 4)
                    Spacer()
                    Text("\(ue.model.coef)")
                }
                HStack{
                    Capsule().frame(width: (ue.model.moyenne*10), height: 10).foregroundColor(getCapsuleColor())
                    Text("\(ue.original.moyenne.formatted(.number))")
                }
                
            }.padding(.horizontal)
            if !isDetail {
                NavigationLink {
                    DetailUEView(ue: ue)
                } label: {
                    Image(systemName: "square.and.pencil")
                }.padding(.horizontal)
            }
        }
        
    }
    
    private func getCapsuleColor() -> Color{
        if ue.model.moyenne > 10 {
            return .red
        }
        return .green
    }
}

struct UECalculetteView_Previews: PreviewProvider {
    static var previews: some View {
        UECalculetteView(ue: UEVM(ue: UEsVM(ues: UEStub.loadUEs(),  blocs: UEStub.loadBlocs()).allUEs[0]), isDetail: false)
    }
}

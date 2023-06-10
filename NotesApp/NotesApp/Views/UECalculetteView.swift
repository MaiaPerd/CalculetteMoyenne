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
                    Text("UE\(ue.nbUe) \(ue.name)").padding(.horizontal, 4)
                    Spacer()
                    if !isDetail {
                        Text("\(ue.coef)")
                    }
                    
                }
                HStack{
                    Capsule().frame(width: (ue.moyenne.floatToCgFloat()*10), height: 10).foregroundColor(getCapsuleColor())
                    Text(String(format: "%.2f", ue.moyenne.floatToCgFloat()))
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
        if ue.moyenne > 10 {
            return .red
        }
        return .green
    }
}

struct UECalculetteView_Previews: PreviewProvider {
    static var previews: some View {
        UECalculetteView(ue: UEVM(model: UEStub.loadUEs().first!), isDetail: false)
    }
}

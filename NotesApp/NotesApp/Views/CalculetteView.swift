//
//  CalculetteView.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 23/05/2023.
//

import SwiftUI

struct CalculetteView: View {
    @ObservedObject var uesVM : UEsVM
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading){
                    HStack{
                        Label("Blocs", systemImage: "doc.on.doc.fill").font(.title2)
                        Spacer()
                    }.padding(.bottom, 5)
                    Text("Vous devez avoir la moyenne à chacun de ces blocs pour avoir votre diplôme.").padding(.bottom, 4)
                    VStack(alignment: .leading){
                        ForEach(uesVM.blocs){bloc in
                            HStack{
                                Label("\(bloc.name):", systemImage: "doc.on.doc.fill")
                                Spacer()
                                Text(String(format: "%.2f", bloc.moyenne))
                                Image(systemName: "graduationcap.circle.fill")
                            }
                            
                        }
                    }.padding(.horizontal)
                }.padding().background(Colors.grey).cornerRadius(10).padding(4)
                Divider()
                VStack{
                    VStack(alignment: .leading){
                        HStack{
                            Label("UEs", systemImage: "doc.fill").font(.title2)
                            Spacer()
                        }.padding()
                        Text("Détail des UEs.").padding(.horizontal).padding(.bottom, 4)
                        ForEach(uesVM.allUEs){ue in
                            VStack{
                                UECalculetteView(ue: UEVM(ue: ue), isDetail: false)
                                Divider().padding(.horizontal, 30)
                            }
                        }
                        
                    }
                }.background(Colors.grey).cornerRadius(10).padding(4)
            }.navigationTitle("Calculette")
                .accentColor(.red)
        }
       
    }
}

struct CalculetteView_Previews: PreviewProvider {
    static var previews: some View {
        CalculetteView(uesVM: UEsVM(ues: UEStub.loadUEs(), blocs: UEStub.loadBlocs()))
    }
}

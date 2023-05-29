//
//  EditDetailView.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 23/05/2023.
//

import SwiftUI

struct EditDetailView: View {
    
    @State private var note: String = "11.5"
    
    var name: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(name).font(.title2)
            ForEach(0..<10){ i in
                HStack(alignment: .center){
                    Text("Matière \(i)")
                    TextField("11.5", text: $note)
                }.padding(.horizontal)
            }
        }
    }
}

struct EditDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EditDetailView(name: "Détail note")
    }
}

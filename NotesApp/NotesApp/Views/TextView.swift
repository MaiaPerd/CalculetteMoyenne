//
//  TextView.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 23/05/2023.
//

import SwiftUI

struct TextView: View {
    var isText: Bool
    var text: String
 //   @ObservedObject var matiere: MatiereVM
    @State private var note: String = "11.5"
    
    var body: some View {
        if isText {
            Text(text)
        } else{
            TextField(text, text: $note)
        }
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(isText: true, text: "100")
    }
}

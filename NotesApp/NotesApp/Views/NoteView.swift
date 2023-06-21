//
//  NoteView.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 23/05/2023.
//

import SwiftUI

struct NoteView: View {
    @ObservedObject var matiere: MatiereVM
    
    var isText: Bool
    
   var capsuleColor: Color{
        if matiere.note >= 10 {
            return .red
        } else {
             return .green
        }
    }
    
    init(matiere: MatiereVM, isText: Bool) {
        self.matiere = matiere
        self.isText = isText
        if isText == false {
            self.matiere.onEditing()
        }
    }
    
    var body: some View {
        HStack{
            if isText {
                if matiere.isEditing {
                    Button(action: matiere.onEdited){
                    
                        Image(systemName: "lock.open")
                        
                    }.padding(.horizontal)
                } else {
                    Button(action: matiere.onEditing){
                        
                        Image(systemName: "lock")
                        
                    }.padding(.horizontal)
                }
                
            }
           
            VStack(alignment: .leading){
                HStack{
                    if !matiere.isEditing {
                        Text(matiere.name)
                    } else{
                        TextField(matiere.name, text: $matiere.name)
                    }
                    Spacer()
                    if !matiere.isEditing {
                        Text("\(matiere.coef)")
                    } else{
                        TextField("\(matiere.coef)", value: $matiere.coef, formatter: NumberFormatter()) .multilineTextAlignment(.trailing)
                        
                    }
                }
              
                HStack{
                    Capsule().frame(width: getWidth() , height: 10).foregroundColor(capsuleColor) .gesture( DragGesture(minimumDistance: 1, coordinateSpace: .local)
                        .onChanged({
                            value in
                            
                            if matiere.isEditing {
                                if value.location.x <= 200 && value.location.x > 0 {
                                    setWidth(newWidth: value.location.x)
                                }
                            }
                        })
                        )
                    Text(String(format: "%.2f", matiere.note))
                }
    
            }
        }
       
    }
    
    
    private func getWidth() -> CGFloat{
        if matiere.note * 10 < 10 {
            return 10
        }
        return matiere.note.floatToCgFloat() * 10
    }
    
    private func setWidth(newWidth: CGFloat) {
        matiere.note = newWidth.cgFloatToFloat() / 10

    }
    
    private func getLock(){
        
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(matiere: MatiereVM(model: UEStub.loadNotesUE1()[0]), isText: true)
    }
}

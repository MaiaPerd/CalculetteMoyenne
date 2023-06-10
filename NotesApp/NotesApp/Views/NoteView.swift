//
//  NoteView.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 23/05/2023.
//

import SwiftUI

struct NoteView: View {
    @ObservedObject var matiere: MatiereVM
    
    var isLock = true
    
    var isText: Bool
    
    @State var capsuleColor: Color = .clear
    
    init(matiere: MatiereVM, isLock: Bool = true, isText: Bool) {
        self.matiere = matiere
        self.isLock = isLock
        self.isText = isText
        if isText == false {
         //   self.matiere.onEdited()
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
                    Capsule().frame(width: getWidth() , height: 10).foregroundColor(capsuleColor) .onAppear {
                        setCapsuleColor()
                    } .gesture( DragGesture(minimumDistance: 1, coordinateSpace: .local)
                        .onChanged({
                            value in
                            
                            if matiere.isEditing {
                                if value.location.x <= 200 && value.location.x > 0 {
                                    setWidth(newWidth: value.location.x)
                                }
                              
                                
                                /*
                                if value.translation.width < getWidth() {
                                    // left
                                    if value.startLocation.x - value.location.x > 0 {
                                        setWidth(newWidth: /*value.startLocation.x -*/ value.location.x)
                                    }
                                   
                                }

                                if value.translation.width > getWidth() {
                                    // right
                                    if value.location.x - value.startLocation.x <= 200 {
                                        setWidth(newWidth: value.location.x /*- value.startLocation.x*/)
                                    }
                                    
                                }*/
                            }
                                
                        })
                        )
                    Text(String(format: "%.2f", matiere.note))
                }
    
            }
        }
       
    }
    
    private func setCapsuleColor(){
        if matiere.note >= 10 {
            capsuleColor = .red
        } else {
            capsuleColor = .green
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
        setCapsuleColor()
    }
    
    private func getLock(){
        
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(matiere: MatiereVM(model: UEStub.loadNotesUE1()[0]), isText: true)
    }
}

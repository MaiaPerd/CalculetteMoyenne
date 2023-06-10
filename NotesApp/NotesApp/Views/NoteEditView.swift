//
//  NoteEditView.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 10/06/2023.
//

import SwiftUI

struct NoteEditView: View {
    @ObservedObject var matiere: MatiereVM
    @State var capsuleColor: Color = .clear
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                HStack{
                    TextField(matiere.name, text: $matiere.name)
                    Spacer()
                    TextField("\(matiere.coef)", value: $matiere.coef, formatter: NumberFormatter()) .multilineTextAlignment(.trailing)
                }
              
                HStack{
                    Capsule().frame(width: getWidth() , height: 10).foregroundColor(capsuleColor) .onAppear {
                        setCapsuleColor()
                    } .gesture( DragGesture(minimumDistance: 1, coordinateSpace: .local)
                        .onChanged({
                            value in
                                if value.location.x <= 200 && value.location.x > 0 {
                                    setWidth(newWidth: value.location.x)
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

struct NoteEditView_Previews: PreviewProvider {
    static var previews: some View {
        NoteEditView(matiere: MatiereVM(model: UEStub.loadNotesUE1()[0]))
    }
}

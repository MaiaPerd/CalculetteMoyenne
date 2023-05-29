//
//  BlocVM.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 26/05/2023.
//

import Foundation
import Model


public class BlocVM : ObservableObject  {
    public var original: Bloc
    
    public init(bloc: Bloc){
        self.original = bloc
    }
}

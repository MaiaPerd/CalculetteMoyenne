//
//  FloatExtension.swift
//  NotesApp
//
//  Created by Perderizet Maïa on 26/05/2023.
//

import Foundation

extension Float {
    func floatToCgFloat()->CGFloat{
        return CGFloat(self)
    }
}

extension CGFloat {
    func cgFloatToFloat()->Float{
        return Float(self)
    }
}


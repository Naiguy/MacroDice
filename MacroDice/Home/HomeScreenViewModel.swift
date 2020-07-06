//
//  HomeScreenViewModel.swift
//  MacroDice
//
//  Created by Nawid Ayobi on 7/5/20.
//  Copyright © 2020 Nawid Ayobi. All rights reserved.
//

import Foundation

class HomeScreenViewModel {
    private var macros : [Macro] = []
    
    func addMacroAtEnd(macro: Macro) {
        macros.append(macro)
    }
    
    func removeMacro(from index: Int) -> Macro {
        macros.remove(at: index)
    }
    
    func moveMacro(from originalIndex: Int, to newIndex: Int) {
        addMacro(removeMacro(from: originalIndex), at: newIndex)
    }
    
    func addMacro(_ macro: Macro, at index: Int) {
        macros.insert(macro, at: index)
    }
    
    func validateMacro(at index: Int) {
        //
    }
    
    func getMacroNames() -> [String] {
        var resultList : [String] = []
        for eachMacro in macros {
            resultList.append(eachMacro.name)
        }
        return resultList
    }
    
    func getMacroSignatures() -> [String] {
        var resultList : [String] = []
        for eachMacro in macros {
            resultList.append(eachMacro.signature)
        }
        return resultList
    }
    
    func getMacros() -> [Macro] {
        return macros
    }
    
}

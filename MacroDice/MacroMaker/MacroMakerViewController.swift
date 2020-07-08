//
//  MacroMakerViewController.swift
//  MacroDice
//
//  Created by Nawid Ayobi on 7/5/20.
//  Copyright © 2020 Nawid Ayobi. All rights reserved.
//

import UIKit
import Foundation

class MacroMakerViewController: UIViewController {
    
    var macroDelegate: MacroPassingDelegate!

    @IBAction func confirmAction(_ sender: UIButton) {
        self.dismiss(animated: true) {
            let newMacro = self.extractMacroFromSelection()
            self.macroDelegate.didCompleteMacro(newMacro)
        }
    }
    
    @IBOutlet weak var macroName: UITextField!
    @IBOutlet weak var macroSignaturePicker: UIPickerView!
    @IBOutlet weak var pickerConfirmButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create a Macro"
        setupPicker()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        macroSignaturePicker.selectRow(0, inComponent: 0, animated: true)
        macroSignaturePicker.selectRow(5, inComponent: 1, animated: true)
        macroSignaturePicker.selectRow(10, inComponent: 2, animated: true)
    }
    
    func setupPicker() {
        macroSignaturePicker.delegate = self
        macroSignaturePicker.dataSource = self
    }
    
    func extractMacroFromSelection() -> Macro {
        var resultSignature = ""
        if macroName.text! == "" {
            macroName.text = ""
        }
        let numberOfDice = Constants.pickerDiceNumbers[macroSignaturePicker.selectedRow(inComponent: 0)]
        let dieType = Constants.pickerDiceOptions[macroSignaturePicker.selectedRow(inComponent: 1)]
        let modifierValue = macroSignaturePicker.selectedRow(inComponent: 2)-10
        if modifierValue > -1 {
            resultSignature = "\(numberOfDice)\(dieType)+\(modifierValue)"
        } else {
            resultSignature = "\(numberOfDice)\(dieType)\(modifierValue)"
        }
        return Macro(name: macroName.text!, signature: resultSignature)
    }
}

extension MacroMakerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return Constants.pickerDiceNumbers.count
        case 1:
            return Constants.pickerDiceOptions.count
        case 2:
            return Constants.pickerModifierNumbers.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch component {
        case 0:
            return "\(Constants.pickerDiceNumbers[row])"
        case 1:
            return Constants.pickerDiceOptions[row]
        case 2:
            if Constants.pickerModifierNumbers[row] < 0 {
                return "\(Constants.pickerModifierNumbers[row])"
            } else {
                return "+\(Constants.pickerModifierNumbers[row])"
            }
        default: return "ERROR"
        }
    }
    
    
    
    
}

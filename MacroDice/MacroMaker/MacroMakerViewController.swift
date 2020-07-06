//
//  MacroMakerViewController.swift
//  MacroDice
//
//  Created by Nawid Ayobi on 7/5/20.
//  Copyright © 2020 Nawid Ayobi. All rights reserved.
//

import UIKit
import Foundation

class MacroMakerViewController: UIViewController, UIPickerViewDelegate {

    // Macro Name - Text Field
    // Macro Dice Edit Button - X dY + Z
    // Create button - 
    
    
    @IBOutlet weak var macroName: UITextField!
    @IBOutlet weak var macroSignaturePicker: UIPickerView!
    @IBOutlet weak var pickerConfirmButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create a Macro"
    }


}

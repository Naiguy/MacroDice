//
//  MacroMakerViewController.swift
//  MacroDice
//
//  Created by Nawid Ayobi on 7/5/20.
//  Copyright © 2020 Nawid Ayobi. All rights reserved.
//

import UIKit
import Foundation
import CoreGraphics

class MacroMakerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var macroDelegate: MacroPassingDelegate!
    var imageIsChosen: Bool!
    let imagePicker = UIImagePickerController()
    

    @IBAction func confirmAction(_ sender: UIButton) {
        self.dismiss(animated: true) {
            let newMacro = self.extractMacroFromSelection()
            self.macroDelegate.didCompleteMacro(newMacro)
        }
    }
    
    
    @IBOutlet weak var imageTapped: UIImageView!
    
    @IBOutlet weak var macroName: UITextField!
    @IBOutlet weak var macroSignaturePicker: UIPickerView!
    @IBOutlet weak var macroImage: UIImageView!
    @IBOutlet weak var pickerConfirmButton: UIButton!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create a Macro"
        
        setupPicker()
        setupImage()
        setupLoadingIndicator()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        macroSignaturePicker.selectRow(0, inComponent: 0, animated: true)
        macroSignaturePicker.selectRow(5, inComponent: 1, animated: true)
        macroSignaturePicker.selectRow(10, inComponent: 2, animated: true)
        macroImage.fadeInAndOut()
    }
    
    func createSpinnerView() {
        let child = SpinnerViewController()

        // add the spinner view controller
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)

        // wait two seconds to simulate some work happening
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // then remove the spinner view controller
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
    }
    
    @objc func chooseImage() {
        macroImage.nukeAllAnimations()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        createSpinnerView()
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func setupPicker() {
        macroSignaturePicker.delegate = self
        macroSignaturePicker.dataSource = self
    }
    
    func setupImage() {
        macroImage.isUserInteractionEnabled = true
        imageIsChosen = false
        imagePicker.delegate = self
        macroImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(chooseImage)))
    }
    
    func setupLoadingIndicator() {
        loadingIndicator.stopAnimating()
        loadingIndicator.isHidden = true
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
        default:
                return "ERROR"
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            macroImage.contentMode = .scaleAspectFill
            macroImage.clipsToBounds = true
            let pickedImageHeight = pickedImage.cgImage?.height
            let pickedImageWidth = pickedImage.cgImage?.width
            let heightIsLesser = pickedImageHeight! < pickedImageWidth!
            
            macroImage.image = pickedImage //.crop(to: macroImage.bounds)
            
        }
        self.dismiss(animated: true, completion: nil)
    }
}

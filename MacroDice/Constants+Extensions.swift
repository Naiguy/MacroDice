//
//  Extensions.swift
//  MacroDice
//
//  Created by Nawid Ayobi on 7/5/20.
//  Copyright © 2020 Nawid Ayobi. All rights reserved.
//

import Foundation
import UIKit

public enum Constants {
    static let cornerRadius: CGFloat = 15
    static let pickerDiceNumbers: [Int] = Array(1...20)
    static let pickerDiceOptions: [String] = ["d4","d6","d8","d10","d12","d20","d100"]
    static let pickerModifierTypeOptions: [String] = ["+","-"]
    static let pickerModifierNumbers: [Int] = Array(-10...50)
}

extension UIButton {
    func pulsate() {
        let originalColor = self.titleColor(for: .normal)
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        self.setTitleColor(.red, for: .normal)
        pulse.duration = 0.2
        pulse.fromValue = 0.95
        pulse.toValue = 1.05
        pulse.autoreverses = true
        pulse.repeatCount = 0
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        self.setTitleColor(originalColor, for: .normal)
        layer.add(pulse, forKey: nil)
    }
    func animateGreen() {
        //
    }
    func animateRed() {
        //
    }
}

extension UIView {
    func fadeInAndOut() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [UIView.AnimationOptions.curveEaseIn, UIView.AnimationOptions.repeat, UIView.AnimationOptions.autoreverse], animations: {
            self.backgroundColor = UIColor.clear
        }, completion: nil)
    }
}

protocol MacroPassingDelegate {
    func didCompleteMacro(_ macro: Macro)
}

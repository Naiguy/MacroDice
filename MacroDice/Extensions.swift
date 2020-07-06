//
//  Extensions.swift
//  MacroDice
//
//  Created by Nawid Ayobi on 7/5/20.
//  Copyright © 2020 Nawid Ayobi. All rights reserved.
//

import Foundation
import UIKit

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

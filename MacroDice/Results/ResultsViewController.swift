//
//  ResultsViewController.swift
//  MacroDice
//
//  Created by Nawid Ayobi on 7/9/20.
//  Copyright © 2020 Nawid Ayobi. All rights reserved.
//

import UIKit
import anim

class ResultsViewController: UIViewController {
    var viewModel: ResultsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ResultsViewModel()
        anim.defaultSettings.isUserInteractionsEnabled = true
        //anim works!!
    }
}

//
//  HomeScreenViewController.swift
//  MacroDice
//
//  Created by Nawid Ayobi on 5/10/20.
//  Copyright © 2020 Nawid Ayobi. All rights reserved.
//

// CREDIT: Smashicons

import UIKit

class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var createButton: UIButton!
    @IBAction func createAction(_ sender: UIButton) {
        sender.pulsate()
        let newViewController = MacroMakerViewController()
        newViewController.macroDelegate = self as MacroPassingDelegate
        present(newViewController, animated: true, completion: nil)
    }
    var mainColor = UIColor.darkGray
    var secondaryColor = UIColor.white
    var shadowColor = UIColor.red
    var shadowValidColor = UIColor.green
    
    var viewModel: HomeScreenViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MacroDice"
        setupCreateButton()
        setupTableView()
        viewModel = HomeScreenViewModel()
    }
    
    private func setupCreateButton() {
        createButton.imageView?.layer.cornerRadius = createButton.bounds.height / 2
        createButton.layer.cornerRadius = createButton.bounds.size.width / 2
        //createButton.layer.shadowColor = mainColor.cgColor
        //createButton.layer.shadowRadius = 5
        //createButton.layer.shadowOpacity = 0.5
    }
    
    
    
}

extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let macroCellNib = UINib(nibName: "MacroCell", bundle: nil)
        tableView.register(macroCellNib, forCellReuseIdentifier: "MacroCell")
        tableView.rowHeight = 100 // Rewrite for size classes!
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // each section is its own row for spacing!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.getMacros().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MacroCell", for: indexPath) as! MacroCell
        cell.nameLabel?.text = viewModel.getMacroNames()[indexPath.section]
        var displayedSignature = viewModel.getMacroSignatures()[indexPath.section]
        if displayedSignature.suffix(2) == "+0" {
            displayedSignature.removeLast(2)
        }
        cell.signatureLabel?.text = displayedSignature
        cell.contentView.layer.borderWidth = 3
        cell.contentView.layer.cornerRadius = Constants.cornerRadius
        cell.contentView.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
       let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 0))
        footerView.backgroundColor = .clear
        return footerView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
}

extension HomeScreenViewController: MacroPassingDelegate {
    func didCompleteMacro(_ macro: Macro) {
        viewModel.addMacroAtEnd(macro: macro)
        tableView.reloadData()
        print(viewModel.getMacros().count)
    }
}

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
        present(newViewController, animated: true) {
            print("presented")
        }
    }
    var mainColor = UIColor.darkGray
    var secondaryColor = UIColor.white
    var shadowColor = UIColor.red
    var shadowValidColor = UIColor.green
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MacroDice"
        setupCreateButton()
        setupTableView()
    }
    
    private func setupCreateButton() {
        createButton.imageView?.layer.cornerRadius = createButton.bounds.height / 2
        createButton.layer.cornerRadius = createButton.bounds.size.width / 2
        createButton.layer.shadowColor = mainColor.cgColor
        createButton.layer.shadowRadius = 5
        createButton.layer.shadowOpacity = 0.5
    }
    
}

extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MacroCell.self, forCellReuseIdentifier: "MacroCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MacroCell", for: indexPath)
        return cell
    }
    
    
}

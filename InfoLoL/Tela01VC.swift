//
//  ViewController.swift
//  InfoLoL
//
//  Created by Enzo Rodrigues on 06/08/23.
//

import UIKit

class Tela01VC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    
    func configTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.backgroundColor = .lightGray
    }

}

extension Tela01VC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        cell?.setupLabel(nameLabel: "Campeoes")
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
    
}


//
//  ListViewController.swift
//  modana_mobile_Muhammad
//
//  Created by Muhammad Reynaldi on 12/03/20.
//  Copyright © 2020 -. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMainInterface()
    }
    
    @IBAction func searchTapped(_ sender: Any) {
    }
    
}
extension ListViewController{
    func setMainInterface() {
        searchBar.setLeftPaddingPoints(15)
        searchBar.outerRound()
        searchBar.layer.borderColor = UIColor.gray.cgColor
        searchBar.layer.borderWidth = 0.8
    }
    
}

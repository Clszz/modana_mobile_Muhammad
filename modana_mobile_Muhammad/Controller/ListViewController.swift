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
    var listOfPublics = [Public]() {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.updateUI()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMainInterface()
        updateUI()
        registerCell()
        tableDelegate()
        searchDelegate()
    }
    
    @IBAction func searchTapped(_ sender: Any) {
        requestAPI(category: searchBar.text ?? "")
    }
    
}
extension ListViewController{
    func setMainInterface() {
        searchBar.setLeftPaddingPoints(20)
        searchBar.outerRound()
        searchBar.layer.borderColor = UIColor.gray.cgColor
        searchBar.layer.borderWidth = 0.8
    }
    
    func updateUI() {
        if listOfPublics.isEmpty{
            self.tableView.tableFooterView = UIView()
            let noDataLabel: UILabel  = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            noDataLabel.text          = "NO DATA"
            noDataLabel.textColor     = UIColor.black
            noDataLabel.textAlignment = .center
            tableView.backgroundView  = noDataLabel
        }
    }
    
    func requestAPI(category:String) {
        let publicReq = PublicService(category: category)
        publicReq.getPublic { [weak self] result in
            switch result{
                case .failure(_):
                    self?.listOfPublics = []
                case .success(let publics):
                    self?.listOfPublics = publics
            }
        }
    }
    
}
extension ListViewController: UISearchBarDelegate,UITextFieldDelegate{
    func searchDelegate() {
        searchBar.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let searchBarText = searchBar.text else { return false}
        let publicReq = PublicService(category: searchBarText)
        publicReq.getPublic { [weak self] result in
            switch result{
                case .failure(_):
                    self?.listOfPublics = []
                case .success(let publics):
                    self?.listOfPublics = publics
            }
        }
        return true
    }
    
}
extension ListViewController: UITableViewDataSource, UITableViewDelegate{
    func registerCell() {
        tableView.register(UINib(nibName: "ContentTableViewCell", bundle: nil), forCellReuseIdentifier: "ContentTableViewCellID")
    }
    
    func tableDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfPublics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentTableViewCellID", for: indexPath) as! ContentTableViewCell
        
        let data = listOfPublics[indexPath.row]
        cell.setCell(description: data.Description, link: data.Link, category: data.Category)
        
        return cell
    }
}

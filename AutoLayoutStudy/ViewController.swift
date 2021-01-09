//
//  ViewController.swift
//  AutoLayoutStudy
//
//  Created by Yeon on 2020/12/23.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
        registCell()
    }
    
    // MARK: - setup
    private func setUpNavigationBar() {
        let searchBar = UISearchController()
        self.navigationItem.searchController = searchBar
        self.navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    private func registCell() {
        self.tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "myCell")
        self.tableView.register(UINib(nibName: "FriendTableViewCell", bundle: nil), forCellReuseIdentifier: "friend")
    }
    
    // MARK: - dataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? MyTableViewCell
            return cell ?? UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "friend") as? FriendTableViewCell
        return cell ?? UITableViewCell()
    }
}

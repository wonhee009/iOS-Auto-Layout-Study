//
//  ViewController.swift
//  AutoLayoutStudy
//
//  Created by Yeon on 2020/12/23.
//

import UIKit

class ViewController: UITableViewController {
    private var nameIndexes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpData()
        setUpNavigationBar()
        registCell()
    }
    
    // MARK: - data
    private func setUpData() {
        nameIndexes = friends.map { (key, value) -> String in
            return key
        }
        nameIndexes.sort()
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
        if section == 0 {
            return 1
        }
        return friends[nameIndexes[section - 1]]?.count ?? 0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return nameIndexes.count + 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return nil
        }
        return nameIndexes[section - 1]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? MyTableViewCell
            return cell ?? UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "friend") as? FriendTableViewCell
        let currentFriend = friends[nameIndexes[indexPath.section - 1]]?[indexPath.row]
        cell?.nameLabel.text = currentFriend?.name
        
        return cell ?? UITableViewCell()
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return nameIndexes
    }
    
    // MARK: - delegate
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

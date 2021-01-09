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
        setUpFooter()
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
    
    private func setUpFooter() {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        
        let lineView = UIView()
        footerView.addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = UIColor.systemGray5
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineView.topAnchor.constraint(equalTo: footerView.topAnchor).isActive = true
        lineView.leftAnchor.constraint(equalTo: footerView.leftAnchor, constant: 20).isActive = true
        lineView.rightAnchor.constraint(equalTo: footerView.rightAnchor, constant: -12).isActive = true
        
        let totalLabel = UILabel()
        footerView.addSubview(totalLabel)
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        
        totalLabel.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        totalLabel.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        
        let total = friends.reduce(0) { (prev, friend) -> Int in
            let (_, _) = friend
            return prev + friend.value.count
        }
        totalLabel.text = "\(total)개의 연락처"
        
        tableView.tableFooterView = footerView
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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let secondViewController = SecondViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}

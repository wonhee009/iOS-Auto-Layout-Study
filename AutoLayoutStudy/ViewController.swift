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
    }
    
    // MARK: - setup
    private func setUpNavigationBar() {
        let searchBar = UISearchController()
        self.navigationItem.searchController = searchBar
        self.navigationItem.hidesSearchBarWhenScrolling = true
        
        let groupNavigationButton = UIBarButtonItem(title: "그룹", style: .plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = groupNavigationButton
    }

}


//
//  SecondTableViewController.swift
//  AutoLayoutStudy
//
//  Created by Wonhee on 2021/01/10.
//

import UIKit

class SecondTableViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 400.0)
    }
    
    // https://uptech.team/blog/build-resizing-image-in-navigation-bar-with-large-title
    // MARK: - setUp
    private func setUpNavigation() {
        
        let rect:CGRect = CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: 64, height: 64))

            let titleView:UIView = UIView.init(frame: rect)
            /* image */
            let image:UIImage = UIImage.init(named: "test1")!
            let image_view:UIImageView = UIImageView.init(image: image)
            image_view.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
            image_view.center = CGPoint.init(x: titleView.center.x, y: titleView.center.y - 10)
            image_view.layer.cornerRadius = image_view.bounds.size.width / 2.0
            image_view.layer.masksToBounds = true
            titleView.addSubview(image_view)

            /* label */
            let label:UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 30, width: 64, height: 24))
            label.text = "Hello"
            label.font = UIFont.systemFont(ofSize: 12)
            label.textAlignment = .center
            titleView.addSubview(label)

            self.navigationItem.titleView = titleView
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

//
//  ViewController.swift
//  AutoLayoutStudy
//
//  Created by Yeon on 2020/12/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        collection.register(UINib(nibName: "TestCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        collection.dataSource = self
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets.zero
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        
        let halfWidth = UIScreen.main.bounds.width / 3
        flowLayout.itemSize = CGSize(width: halfWidth * 0.9 , height: halfWidth * 0.9)
        self.collection.collectionViewLayout = flowLayout
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TestCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.testImage.image = UIImage(named: "test1")
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
}


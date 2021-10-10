//
//  HomeTabCollectionViewController.swift
//  HomeTabCollectionViewController
//
//  Created by Nika Topuria on 09.10.21.
//

import UIKit

private let reuseIdentifier = "HomeTabCell"

class HomeCollectionVC: UICollectionViewController {
    
    var currentUser: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return OfferSource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HomeTabCell
    
        // Configure the cell
        cell.makeNewCellHome(OfferSource[indexPath.row].image, OfferSource[indexPath.row].text)
    
        return cell
    }



}

//
//  HomeCollectionViewCell.swift
//  HomeCollectionViewCell
//
//  Created by Nika Topuria on 09.10.21.
//

import UIKit

class HomeTabCell: UICollectionViewCell {
 
    
    @IBOutlet var productImage: UIImageView!
    
    
    @IBOutlet var productLabel: UILabel!
    
    
    func makeNewCellHome (_ image: String, _ label: String){
        productImage.image = UIImage.init(named: image)
        productLabel.text = label
    }
}

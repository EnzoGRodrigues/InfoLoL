//
//  CustomCollectionViewCell.swift
//  InfoLoL
//
//  Created by Enzo Rodrigues on 08/08/23.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var championImageView: UIImageView!
    @IBOutlet weak var nameChampionLabel: UILabel!
    
    static let identifier: String = "CustomCollectionViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier.self, bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        championImageView.contentMode = .scaleAspectFill
       
    }
    
    func setupCell(championImage: String){
        championImageView.image = UIImage(named: championImage)
    }
    func setupLabel(championNameLabel: String){
        nameChampionLabel.text = championNameLabel
    }

}

//
//  CustomTableViewCell.swift
//  InfoLoL
//
//  Created by Enzo Rodrigues on 08/08/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var infoChampionsLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewB: UICollectionView!
    @IBOutlet weak var collectionViewC: UICollectionView!
    
    var listChampions : [String] = ["Aatrox", "Ahri", "Akali", "Amumu", "Anivia", "Aphelios", "Ashe", "AurelionSol", "Azir", "Belveth", "Blitzcrank", "Brand", "Braum", "Caitlyn", "Camille", "Chogath", "Corki", "Darius", "Diana", "Draven", "DrMundo", "Ekko", "Elise", "Evelynn", "Ezreal"]
    var listChampionsB : [String] = ["Zyra", "Zoe", "Zilean", "Ziggs", "Zed", "Zac", "Yuumi", "Yorick", "Yone", "Yasuo", "XinZhao", "Xerath"]

    
    static let identifier: String = "CustomTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: identifier.self, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       configCollectionView()
        contentView.backgroundColor = .lightGray
    }
    
    func configCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionViewB.dataSource = self
        collectionViewB.delegate = self
        
        collectionViewC.dataSource = self
        collectionViewC.delegate = self
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
        }
        
        collectionView.register(CustomCollectionViewCell.nib(), forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
        if let layoutB = collectionViewB.collectionViewLayout as? UICollectionViewFlowLayout{
            layoutB.scrollDirection = .horizontal
            layoutB.estimatedItemSize = .zero
        }
        
        collectionViewB.register(CustomCollectionViewCell.nib(), forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
        if let layoutC = collectionViewC.collectionViewLayout as? UICollectionViewFlowLayout{
            layoutC.scrollDirection = .horizontal
            layoutC.estimatedItemSize = .zero
        }
        
        collectionViewB.register(CustomCollectionViewCell.nib(), forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
        collectionView.backgroundColor = .systemPink
        collectionViewB.backgroundColor = .systemBlue
        collectionViewC.backgroundColor = .systemGreen
    }
    
    func setupLabel(nameLabel: String){
        infoChampionsLabel.text = nameLabel
        infoChampionsLabel.font = .boldSystemFont(ofSize: 30)
        
    }
    
}

extension CustomTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listChampions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
            cellA?.setupCell(championImage: listChampions[indexPath.row])
            cellA?.setupLabel(championNameLabel: listChampions[indexPath.row])
            return cellA ?? UICollectionViewCell()
        }else{
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
            cellB?.setupCell(championImage: listChampionsB[indexPath.row])
            cellB?.setupLabel(championNameLabel: listChampionsB[indexPath.row])
            return cellB ?? UICollectionViewCell()
        }
    }
        

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.frame.width, height: 300)
    }
    
}

//
//  CollectionTableViewCell.swift
//  AnimeManiac
//
//  Created by David-IOS on 15/01/2022.
//

import UIKit

class CollectionTableViewCell: UITableViewCell, CellConfigurable {
    
    var animePage : [AnimePage]?
    weak var cellVM : HorizontalScrollCellViewModel?
    weak var controller : UIViewController?
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        guard let cellVM = cellViewModel as? HorizontalScrollCellViewModel else {
            return
        }
        self.animePage = cellVM.animePage
        self.cellVM = cellVM
        self.controller = controller
        self.collectionView.reloadData()
    }
    
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        print("blabla")
    }
    
}

extension CollectionTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return animePage?.count ?? 0
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
         cell.configure(animePage : self.animePage![indexPath.row])
         return cell
     }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.cellPressed(from: self.controller!)
    }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexpath: IndexPath) -> CGSize {
         return CGSize(width: 150, height: 220)
     }
}

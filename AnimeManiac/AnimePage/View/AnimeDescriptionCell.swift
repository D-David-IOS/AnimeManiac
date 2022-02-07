//
//  AnimeDescriptionCell.swift
//  AnimeManiac
//
//  Created by David-IOS on 23/01/2022.
//

import UIKit

class AnimeDescriptionCell: UITableViewCell, CellConfigurable {
    
    @IBOutlet weak var synopsisLabel: UILabel!
  
    @IBOutlet weak var sysnopsisTextView: UITextView!
    
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        guard let cellVM = cellViewModel as? AnimeDescriptionCellViewModel else {
            return
        }
        self.synopsisLabel.text = "Synopsis : "
        
        if cellVM.animePage.synopsis == "" {
            cellVM.animePage.synopsis = "Description will be added later..."
        }
        
        // Configure title
        self.sysnopsisTextView.text = cellVM.animePage.synopsis
       
        textViewDidChange(self.sysnopsisTextView)
        
        // Set height to cellVM to
        cellVM.height = Float(self.sysnopsisTextView.frame.size.height + self.synopsisLabel.frame.size.height)
        print(cellVM.height)
    }
    
    func textViewDidChange(_ textView: UITextView) {
          let fixedWidth = textView.frame.size.width
          textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
          let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
          var newFrame = textView.frame
          newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
          textView.frame = newFrame
    }
    
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
    }
    
}

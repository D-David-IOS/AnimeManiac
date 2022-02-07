//
//  AnimeYoutubeCell.swift
//  AnimeManiac
//
//  Created by David-IOS on 29/01/2022.
//

import UIKit
import youtube_ios_player_helper

class AnimeYoutubeCell: UITableViewCell, CellConfigurable {
    
    @IBOutlet weak var playerView: YTPlayerView!
    
    
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        guard let cellVM = cellViewModel as? AnimeYoutubeCellViewModel else {
            return
        }
        self.playerView.load(withVideoId: cellVM.animePage.youtubeId!)
    }
    
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        
    }
}

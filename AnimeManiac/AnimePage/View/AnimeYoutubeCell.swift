//
//  AnimeYoutubeCell.swift
//  AnimeManiac
//
//  Created by David-IOS on 29/01/2022.
//

import UIKit
import youtube_ios_player_helper

// represent the youtube video in anime page
class AnimeYoutubeCell: UITableViewCell, CellConfigurable {
    
    @IBOutlet weak var playerView: YTPlayerView!
    
    // configure the cell, called in controller
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        guard let cellVM = cellViewModel as? AnimeYoutubeCellViewModel else {
            return
        }
        self.playerView.load(withVideoId: cellVM.animePage.youtubeId!)
    }
    
    // action when cell is pressed
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        
    }
}

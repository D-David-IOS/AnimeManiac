//
//  CellConfigurable.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation
import UIKit

protocol CellConfigurable: AnyObject {
    // configure the cell
    func configure(cellViewModel: CellViewModel, from controller: UIViewController)
    // action when cell is pressed
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController)
}

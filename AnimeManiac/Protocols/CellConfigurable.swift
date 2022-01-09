//
//  CellConfigurable.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation
import UIKit

protocol CellConfigurable: AnyObject {
    func configure(cellViewModel: CellViewModel, from controller: UIViewController)
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController)
}

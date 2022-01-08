//
//  Controller.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

@objc protocol Controller {
    
    var presentedController: Controller? { get }
    var navController: NavController? { get }
    
    func present(controller: Controller,
                 animated: Bool,
                 completion: @escaping () -> ())
    
}

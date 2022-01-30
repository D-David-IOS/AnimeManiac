//
//  NavContoller.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

@objc protocol NavController: Controller {
    //push to a new controller
    func push(controller: Controller, animated: Bool)
}

//
//  HomeCell.swift
//  AnimeManiac
//
//  Created by David-IOS on 09/01/2022.
//

import UIKit

class HomeCell: UITableViewCell, CellConfigurable, UISearchBarDelegate {
    
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var searchBar: UISearchBar!
    weak var myController : UIViewController?
    
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        self.myController = controller
        self.searchBar.delegate = self
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
    }
    
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard var search = self.searchBar.text, self.searchBar.text != "" else {
            return
        }
        search = search.replacingOccurrences(of: " ", with: "+")
        let newRouting = Routing()
        let route = SearchByTitleRoutingEntry(search : search)
        _ = newRouting
            .route(routingEntry: route, fromController: self.myController, animated: true)
    }
    
    @IBAction func searchByCategory(_ sender: Any) {
        let index = self.categoryPicker.selectedRow(inComponent: 0)
        let category = Category.genre[index]
        let newRouting = Routing()
        let route = SearchRoutingEntry(category: category)
        _ = newRouting
            .route(routingEntry: route, fromController: self.myController, animated: true)
    }
   
    
}

extension HomeCell : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Category.genre.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Category.genre[row]
    }
    
}

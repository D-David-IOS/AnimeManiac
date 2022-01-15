//
//  HomeController.swift
//  AnimeManiac
//
//  Created by David-IOS on 15/01/2022.
//

import UIKit

class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var models = [Model]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        cell.configure(with: models)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        models.append(Model(text: "blabla", image: "blabla"))
        models.append(Model(text: "blabla", image: "blabla"))
        models.append(Model(text: "blabla", image: "blabla"))
        models.append(Model(text: "blabla", image: "blabla"))
        models.append(Model(text: "blabla", image: "blabla"))
        models.append(Model(text: "blabla", image: "blabla"))
        models.append(Model(text: "blabla", image: "blabla"))
        models.append(Model(text: "blabla", image: "blabla"))
        models.append(Model(text: "blabla", image: "blabla"))
        models.append(Model(text: "blabla", image: "blabla"))
        models.append(Model(text: "blabla", image: "blabla"))
        models.append(Model(text: "blabla", image: "blabla"))
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self

    }

}

struct Model {
    let text: String
    let image : String
    
    init(text:String, image : String){
        self.text = text
        self.image = image
    }
}

//
//  TableViewController.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import UIKit

// the unique Controller in the app
// used in all Pages
class TableViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate{
    
    // the TableView where all Cell will be display
    @IBOutlet weak var tableView: UITableView!
    
    // the viewModel, contains all informations about the current page
    var viewModel: ScrollableViewModel?
    
    // add a Pull to refresh
    let refreshControl = UIRefreshControl()
    
    init(viewModel: ScrollableViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "TableViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // called only in WishList, refresh the page for each action
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard (self.viewModel as? WishListViewModel == nil) else {
            let tabBarOffset = -(self.tabBarController?.tabBar.frame.size.height ?? 0)
            let emptyLoader = EmptyLoader(tabBarOffset: tabBarOffset)
            self.tableView.updateEmptyScreen(emptyReason: emptyLoader)
            self.refresh()
            return
        }
    }
    
    // Display an Empty Error page
    private func updateEmptyState(error: EmptyError, tabBarOffset: CGFloat) {
        
        let emptyReason = EmptyTextAndButton(tabBarOffset: tabBarOffset,
                                             customTitle: error.errorTitle ?? "",
                                             customDescription: error.errorDescription ?? "",
                                             image: UIImage(named: error.imageName ?? "noInternet")!,
                                             buttonTitle: error.buttonTitle ?? "Error") {
            switch error.errorAction {
            case .refresh:
                self.refresh()
            case .goBack :
                self.navigationController?.popViewController(animated: true)
            case .navigate :
                self.tabBarController?.selectedIndex = 0
            }
        }
        self.tableView.updateEmptyScreen(emptyReason: emptyReason)
        self.tableView.reloadData()
    }
    
    // refresh the page
    // register all cells/xib
    @objc func refresh() {
        self.viewModel?.loadData { [weak self] error in
            if let error = error {
                let tabBarOffset = -(self?.tabBarController?.tabBar.frame.size.height ?? 0)
                self?.updateEmptyState(error: error,
                                       tabBarOffset: tabBarOffset)
            } else {
                self?.registerCells()
                self?.refreshControl.endRefreshing()
                self?.tableView.reloadData()
            }
        }
        
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // only in WishListViewModel
        guard (self.viewModel as? WishListViewModel == nil) else {
            refreshControl.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
            tableView.addSubview(refreshControl)
            navigationItem.title = viewModel?.title
            
            tableView.delegate = self
            tableView.dataSource = self
            return
        }
        let tabBarOffset = -(self.tabBarController?.tabBar.frame.size.height ?? 0)
        let emptyLoader = EmptyLoader(tabBarOffset: tabBarOffset)
        self.tableView.updateEmptyScreen(emptyReason: emptyLoader)
        self.refresh()
        
        refreshControl.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
        navigationItem.title = viewModel?.title
        
        tableView.delegate = self
        tableView.dataSource = self
    }
   
    
    // MARK: - Register
    public func registerCells() {
        guard let sections = self.viewModel?.sections else { return }
        
        for i in 0..<sections.count {
            let section = sections[i]
            
            let items = section.cellsVM
            
            for j in 0..<items.count {
                let item = items[j]
                
                // We store index path for item
                item.indexPath = IndexPath(row: j,
                                           section: i)
                
                // If we don't have a nibName, we use the default UITableViewCell
                guard let nibName = item.nibName else {
                    tableView.register(UITableViewCell.self,
                                       forCellReuseIdentifier: item.reuseIdentifier)
                    continue
                }
                
                // Otherwise we use the one from the xib
                let nib = UINib(nibName: nibName,
                                bundle: Bundle(for: type(of: item)))
                self.tableView.register(nib,
                                        forCellReuseIdentifier: item.reuseIdentifier)
            }
        }
    }
}

// all TableView Functions
extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    // the number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let vm = self.viewModel else {
            return 0
        }
        return vm.numberOfSections()
    }
    
    // the numbers of items in the section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let vm = self.viewModel else {
            return 0
        }
        return vm.numberOfItems(in: section)
    }
    
    // the cell at the IndexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellVM = self.viewModel?.item(at: indexPath) else {
            return UITableViewCell()
        }
        
        let reuseIdentifier = cellVM.reuseIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,
                                                 for: indexPath)
        
        return cell
    }
    
    // Configure the cell, with the informations present in the CellViewModel
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cellVM = self.viewModel?.item(at: indexPath),
              let configurableCell = cell as? CellConfigurable else {
                  return
              }
        self.tableView(tableView, prefetchRowsAt: [indexPath])
        configurableCell.configure(cellViewModel: cellVM,
                                   from: self)
    }
    
    // add an action when user tap one the cell
    // the action is definited in the cellViewModel with a Routing Entry
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellVM = self.viewModel?.item(at: indexPath) else {
            return
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellVM.reuseIdentifier)
        let configurableCell = cell as? CellConfigurable
        configurableCell?.cellPressed(cellViewModel: cellVM,
                                      from: self)
    }
    
    // Return the heigth for the cell
    // this information is present in the CellViewModel
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellVM = self.viewModel?.item(at: indexPath) as? TableCellViewModel else {
            return UITableView.automaticDimension
        }
        
        return CGFloat(cellVM.height)
    }
    
    // Return the estimated heigth for the cell
    // this information is present in the CellViewModel
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellVM = self.viewModel?.item(at: indexPath) as? TableCellViewModel else {
            return UITableView.automaticDimension
        }
        
        return CGFloat(cellVM.height)
    }
    
    // with a swap on the left the user can choose an action
    // the user can choose "delete", "seen" or "Progress"
    // only TableEditedCellViewModel can be edited
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let cellVM = self.viewModel?.item(at: indexPath) as? TableEditedCellViewModel else {
            return .none
        }
        
        let delete = UIContextualAction(style: .destructive,
                                        title: "Delete") { (_, _, _) in
            
            
            cellVM.completionDelete { [weak self] error in
                self?.refresh()
            }
        }
        delete.backgroundColor = .systemRed
        
        let seen = UIContextualAction(style: .normal,
                                      title: "Seen") { (_, _, _) in
            
            cellVM.completionAlreadySeen { [weak self] _ in
                self?.refresh()
            }
            
        }
        seen.backgroundColor = .systemGreen
        
        let inProgress = UIContextualAction(style: .normal,
                                            title: "Progress") { _,_,_ in
            
            cellVM.completionInProgress { [weak self] _ in
                self?.refresh()
            }
        }
        inProgress.backgroundColor = .systemOrange
        
        // the user has 3 differents, but it depends of context ( present in already saw etc...)
        let configuration = UISwipeActionsConfiguration(actions: [delete, seen, inProgress])
        let configuration2 = UISwipeActionsConfiguration(actions: [delete, seen])
        let configuration3 = UISwipeActionsConfiguration(actions: [delete])
        
        if cellVM.stateAnime.inProgress {
            return configuration2
        } else if cellVM.stateAnime.alreadySaw {
            return configuration3
        } else {
            return configuration
        }
        
    }
    
}

// call the function LoadMore in InfiniteScrollableViewModel
// load 20 new animes
extension TableViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard let vm = self.viewModel as? InfiniteScrollableViewModel else {
            return
        }
        
        if indexPaths.contains(where: vm.isLoadingSection) && vm.canLoadMore {
            vm.loadMore { [weak self] _ in
                self?.registerCells()
                self?.tableView.reloadData()
            }
        }
    }
}

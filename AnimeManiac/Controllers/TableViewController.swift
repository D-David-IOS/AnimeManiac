//
//  TableViewController.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import UIKit

class TableViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ScrollableViewModel?
    
    let refreshControl = UIRefreshControl()
    
    init(viewModel: ScrollableViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "TableViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Display loader
        let tabBarOffset = -(self.tabBarController?.tabBar.frame.size.height ?? 0)
        let emptyLoader = EmptyLoader(tabBarOffset: tabBarOffset)
        self.tableView.updateEmptyScreen(emptyReason: emptyLoader)
        self.refresh()
    }
    
    private func updateEmptyState(error: EmptyError, tabBarOffset: CGFloat) {
        
        let emptyReason = EmptyTextAndButton(tabBarOffset: tabBarOffset,
                                             customTitle: error.errorTitle ?? "",
                                             customDescription: error.errorDescription ?? "",
                                             image: UIImage(named: error.imageName ?? "noInternet")!,
                                             buttonTitle: error.buttonTitle ?? "Error") {
            switch error.errorAction {
            case .refresh:
                self.refresh()
            case .search:
                self.refresh()
            case .navigate(let entry):
                let routing = Routing()
                _ = routing.route(routingEntry: entry)
            }
        }
        self.tableView.updateEmptyScreen(emptyReason: emptyReason)
        self.tableView.reloadData()
    }
    
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

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let vm = self.viewModel else {
            return 0
        }
        return vm.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let vm = self.viewModel else {
            return 0
        }
        return vm.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellVM = self.viewModel?.item(at: indexPath) else {
            return UITableViewCell()
        }
        
        let reuseIdentifier = cellVM.reuseIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,
                                                 for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cellVM = self.viewModel?.item(at: indexPath),
              let configurableCell = cell as? CellConfigurable else {
                  return
              }
        self.tableView(tableView, prefetchRowsAt: [indexPath])
        configurableCell.configure(cellViewModel: cellVM,
                                   from: self)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellVM = self.viewModel?.item(at: indexPath) else {
            return
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellVM.reuseIdentifier)
        let configurableCell = cell as? CellConfigurable
        configurableCell?.cellPressed(cellViewModel: cellVM,
                                      from: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellVM = self.viewModel?.item(at: indexPath) as? TableCellViewModel else {
            return UITableView.automaticDimension
        }
        
        return CGFloat(cellVM.height)
    }
   
    
}

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

//
//  CollectionViewController.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    private var viewModel: ScrollableViewModel
    private var compositionalLayout: CompositionalLayoutProtocol?
    private let refreshControl = UIRefreshControl()
    private let searchBar = UISearchBar()
    
    // MARK: - Init
    init(viewModel: ScrollableViewModel,
         compositionalLayout: CompositionalLayoutProtocol) {
        self.viewModel = viewModel
        self.compositionalLayout = compositionalLayout
        super.init(nibName: "CollectionViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        self.collectionView.prefetchDataSource = self
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        self.collectionView.addSubview(refreshControl)
        self.searchBar.delegate = self
        self.collectionView.showsVerticalScrollIndicator = false
        self.refresh()
    }
    
    @objc func refresh() {
        
        let tabBarOffset = -(self.tabBarController?.tabBar.frame.size.height ?? 0)
        let emptyLoader = EmptyLoader(tabBarOffset: tabBarOffset)
        self.collectionView.updateEmptyScreen(emptyReason: emptyLoader)
                
        self.viewModel.loadData { [weak self] error in
            
            guard let strongSelf = self else { return }
            
            if strongSelf.viewModel.canRefreshNavBar {
                strongSelf.configureNavBar()
            }
            strongSelf.emptyLoad(error: error, tabBarOffSet: tabBarOffset )
        }
    }
    
    private func emptyLoad(error : EmptyError?, tabBarOffSet: CGFloat) {
        
        if let error = error {
            let emptyReason = EmptyTextAndButton(tabBarOffset: tabBarOffSet,
                                                 customTitle: error.errorTitle ?? "",
                                                 customDescription: error.errorDescription ?? "",
                                                 image: UIImage(named: error.imageName ?? "noInternet")!,
                                                 buttonTitle: error.buttonTitle ?? "Retry") {
                switch error.errorAction {
                case .refresh:
                    self.refresh()
                case .search :
                    self.navigationItem.titleView = nil
                    self.compositionalLayout = HomeCompositionalLayout()
                    self.viewModel = HomeViewModel()
                    self.refresh()
                case .navigate(let entry):
                    let routing = Routing()
                    _ = routing.route(routingEntry: entry)
                }
                
            }
            self.collectionView.updateEmptyScreen(emptyReason: emptyReason)
            self.collectionView.reloadData()
        } else {
            self.registerCells()
            self.configureLayout()
            self.refreshControl.endRefreshing()
            self.collectionView.reloadData()
        }
    }
    
    private func displayLoader(error : EmptyError?) {
        let tabBarOffset = -(self.tabBarController?.tabBar.frame.size.height ?? 0)
        let emptyLoader = EmptyLoader(tabBarOffset: tabBarOffset)
        self.collectionView.updateEmptyScreen(emptyReason: emptyLoader)
        self.emptyLoad(error: error, tabBarOffSet: tabBarOffset)
    }
    
    private func configureNavBar() {
        self.navigationItem.title = self.viewModel.title
        self.navigationItem.hidesBackButton = false
        
        guard let rightButtonItem = self.viewModel.rightButtonItem else {
            return
        }
        
        switch rightButtonItem {
        case .search:
            self.navigationItem.titleView = nil
            self.navigationItem.rightBarButtonItem = BarButtonItem(image : rightButtonItem.image()) {
                self.handleShowSearchBar()
            }
        }
    }
    
    
    @objc func handleShowSearchBar() {
        self.searchBar.scopeButtonTitles = [NSLocalizedString("Collections", comment: "Collections"),NSLocalizedString("Products", comment: "Product")]
        navigationItem.titleView = searchBar
        searchBar.showsScopeBar = true
        searchBar.showsCancelButton = true
        navigationItem.rightBarButtonItem = nil
        searchBar.becomeFirstResponder()
    }
    
    private func configureLayout() {
        // Set layout if we have one
        if let layout = self.compositionalLayout {
            collectionView.collectionViewLayout = layout.create()
        }
    }
    
    // MARK: - Register
    public func registerCells() {
        guard let sections = self.viewModel.sections as? [CollectionSection] else { return }
        
        for i in 0..<sections.count {
            let section = sections[i]
            
            // Store section position
            section.position = i
            
            // Register header if needed
            if let headerVM = section.headerVM,
               let nibName = headerVM.nibName {
                self.registerSupplementaryView(kind: UICollectionView.elementKindSectionHeader,
                                               reuseIdentifier: headerVM.reuseIdentifier,
                                               nibName: nibName)
            }
            
            // Register footer if needed
            if let footerVM = section.footerVM,
               let nibName = footerVM.nibName {
                self.registerSupplementaryView(kind: UICollectionView.elementKindSectionFooter,
                                               reuseIdentifier: footerVM.reuseIdentifier,
                                               nibName: nibName)
            }
            
            let items = section.cellsVM
            
            for j in 0..<items.count {
                let item = items[j]
                
                // We store index path for item
                item.indexPath = IndexPath(row: j,
                                           section: i)
                
                // If we don't have a nibName, we use the default UICollectionViewCell
                guard let nibName = item.nibName else {
                    self.collectionView.register(UICollectionViewCell.self,
                                                 forCellWithReuseIdentifier: reuseIdentifier)
                    continue
                }
                
                // Otherwise we use the one from the xib
                let nib = UINib(nibName: nibName,
                                bundle: Bundle(for: type(of: item)))
                self.collectionView.register(nib,
                                             forCellWithReuseIdentifier: item.reuseIdentifier)
            }
            
        }
    }
    
    func registerSupplementaryView(kind: String,
                                   reuseIdentifier: String,
                                   nibName: String) {
        let nib = UINib(nibName: nibName,
                        bundle: Bundle(for: type(of: self)))
        self.collectionView.register(nib,
                                     forSupplementaryViewOfKind: kind,
                                     withReuseIdentifier: reuseIdentifier)
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.viewModel.numberOfSections()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.numberOfItems(in: section)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellVM = self.viewModel.item(at: indexPath)
        let reuseIdentifier = cellVM.reuseIdentifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard self.viewModel.itemAvailable(at: indexPath) else {
            return
        }
        self.collectionView(collectionView, prefetchItemsAt: [indexPath])
        let cellVM = self.viewModel.item(at: indexPath)
        let configurableCell = cell as? CellConfigurable
        configurableCell?.configure(cellViewModel: cellVM,
                                    from: self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard self.viewModel.itemAvailable(at: indexPath) else {
            return
        }
        
        let cellVM = self.viewModel.item(at: indexPath)
        let configurableCell = cell as? CellConfigurable
        configurableCell?.cleanCell(cellViewModel: cellVM, from: self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard self.viewModel.itemAvailable(at: indexPath) else {
            return
        }
        let cellVM = self.viewModel.item(at: indexPath)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellVM.reuseIdentifier,
                                                      for: indexPath)
        let configurableCell = cell as? CellConfigurable
        configurableCell?.cellPressed(cellViewModel: cellVM,
                                      from: self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            
            // Get Header ViewModel
            guard let section = self.viewModel.sections[indexPath.section] as? CollectionSection,
                  let headerViewModel = section.headerVM else {
                      return UICollectionReusableView()
                  }
            
            // Dequeue the reusable view
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: headerViewModel.reuseIdentifier,
                                                                             for: indexPath)
            let configurableHeaderView = headerView as? CellConfigurable
            configurableHeaderView?.configure(cellViewModel: headerViewModel,
                                              from: self)
            return headerView
            
        case UICollectionView.elementKindSectionFooter:
            
            // Get footer ViewModel
            guard let section = self.viewModel.sections[indexPath.section] as? CollectionSection,
                  let footerVM = section.footerVM else {
                      return UICollectionReusableView()
                  }
            
            // Dequeue the reusable view
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: footerVM.reuseIdentifier,
                                                                             for: indexPath)
            
            let configurableFooterView = footerView as? CellConfigurable
            configurableFooterView?.configure(cellViewModel: footerVM,
                                              from: self)
            
            return footerView
            
        default:
            return UICollectionReusableView()
        }
        
    }
}

extension CollectionViewController: UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        guard let vm = self.viewModel as? InfiniteScrollableViewModel else {
            return
        }
        
        if indexPaths.contains(where: vm.isLoadingSection) && vm.canLoadMore {
            vm.loadMore { [weak self] _ in
                self?.registerCells()
                self?.collectionView.reloadData()
            }
        }
    }
}

extension CollectionViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.viewModel.sections.removeAll()
        self.compositionalLayout = HomeCompositionalLayout()
        self.viewModel = HomeViewModel(apiService: ShopifyService(), afService: AlamofireService())
        self.collectionView.reloadData()
        self.configureNavBar()
        self.refresh()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        searchBar.becomeFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.viewModel.sections.removeAll()
        self.collectionView.reloadData()
        guard let text = searchBar.searchTextField.text else {
            return
        }
        
        searchBar.resignFirstResponder()
        if let cancelButton = searchBar.value(forKey: "cancelButton") as? UIButton {
            cancelButton.isEnabled = true
        }
        
        if searchBar.selectedScopeButtonIndex == 0 {
            self.viewModel = SearchCollectionsViewModel(apiService: ShopifyService(), search: text)
            self.compositionalLayout = HomeCompositionalLayout()
            guard let vm = self.viewModel as? SearchCollectionsViewModel else {
                return
            }
            vm.fetchCollection { [weak self] error in
                self?.displayLoader(error: error)
            }
            
        } else if searchBar.selectedScopeButtonIndex == 1 {
            self.viewModel = SearchProductsViewModel(apiService: ShopifyService(), search: text)
            self.compositionalLayout = SeeAllCompositionalLayout()
            guard let vm = self.viewModel as? SearchProductsViewModel else {
                return
            }
            vm.fetchProducts { [weak self] error in
                self?.displayLoader(error: error)
            }
        }
    }
}

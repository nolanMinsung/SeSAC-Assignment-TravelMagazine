//
//  CitySearchingTableViewController.swift
//  CitySearchingApp
//
//  Created by 김민성 on 7/15/25.
//

import UIKit

class CitySearchingTableViewController: UITableViewController {
    
    // MARK: - DataSource
    let cities = CityInfo().city
    var dataSource: CitySearchingDiffableDataSource!
    
    @IBOutlet var citySearchBar: UISearchBar!
    @IBOutlet var cityFilteringSegmentedControl: UISegmentedControl!
    
    private var currentSearchText: String = ""
    private var currentFilteringOption: CityFilteringOption = .all
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigation settings
        navigationController?.navigationBar.backgroundColor = .systemBackground
        
        // table view settings
        let nib = UINib(nibName: "CitySearchingTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "CitySearchingTableViewCell")
        tableView.rowHeight = 170
        
        // initial data loading
        setupDiffableDataSource()
        reloadDiffableDataSource()
        
        citySearchBar.delegate = self
    }
    
    private func setupDiffableDataSource() {
        let cellProvider: UITableViewDiffableDataSource<Int, City>.CellProvider
        = { tableView, indexPath, itemIdentifier in
            
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "CitySearchingTableViewCell"
            ) as! CitySearchingTableViewCell
            cell.configure(with: itemIdentifier)
            return cell
        }
        
        self.dataSource = CitySearchingDiffableDataSource(
            tableView: tableView,
            cellProvider: cellProvider
        )
    }
    
    private func reloadDiffableDataSource() {
        dataSource.applySnapshot(
            searchText: currentSearchText,
            filteringOption: currentFilteringOption
        )
    }
    
    // 검색창이 살짝 가려진 상태에서 필터링 시 필터링 후 contentOffset이 튀는 문제가 있어
    // 검색창이 살짝 가려지는 상황 자체를 최소화하기 위한 조치..
    private func moveToTop(animated: Bool = true) {
        tableView.setContentOffset(.init(x: 0, y: -91), animated: animated)
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        moveToTop(animated: false)
        switch sender.selectedSegmentIndex {
        case 0: currentFilteringOption = .all
        case 1: currentFilteringOption = .domesticOnly
        case 2: currentFilteringOption = .foreignOnly
        default: fatalError("segmented control index out of range.")
        }
        reloadDiffableDataSource()
    }
    
}

// MARK: - UISearchBarDelegate
extension CitySearchingTableViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        moveToTop()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        moveToTop()
        currentSearchText = searchText
        reloadDiffableDataSource()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
}

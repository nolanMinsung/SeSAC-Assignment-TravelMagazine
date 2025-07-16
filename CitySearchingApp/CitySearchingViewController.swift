//
//  CitySearchingViewController.swift
//  CitySearchingApp
//
//  Created by 김민성 on 7/16/25.
//

import UIKit

class CitySearchingViewController: UIViewController {
    
    // MARK: - DataSource
    let cities = CityInfo().city
    var dataSource: CitySearchingDiffableDataSource!
    
    @IBOutlet var citySearchBar: UISearchBar!
    @IBOutlet var cityFilteringSegmentedControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    
    private var currentSearchText: String = ""
    private var currentFilteringOption: CityFilteringOption = .all
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = .label
        
        citySearchBar.delegate = self
        
        // table view settings
        let nib = UINib(nibName: "CitySearchingTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "CitySearchingTableViewCell")
        tableView.rowHeight = 150
        
        // initial data loading
        setupDiffableDataSource()
        reloadDiffableDataSource()
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
        self.tableView.delegate = self
    }
    
    private func reloadDiffableDataSource() {
        dataSource.applySnapshot(
            searchText: currentSearchText,
            filteringOption: currentFilteringOption
        )
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
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
extension CitySearchingViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentSearchText = searchText
        reloadDiffableDataSource()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
}

extension CitySearchingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = (tableView.cellForRow(at: indexPath) as! CitySearchingTableViewCell).city
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "CityDetailViewController") as! CityDetailViewController
        detailViewController.city = city
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}

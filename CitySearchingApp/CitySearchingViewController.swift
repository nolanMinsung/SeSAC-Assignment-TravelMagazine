//
//  CitySearchingViewController.swift
//  CitySearchingApp
//
//  Created by 김민성 on 7/16/25.
//

import UIKit

class CitySearchingViewController: UIViewController {
    
    // MARK: - DataSource
    var dataSource: CitySearchingDiffableDataSource!
    
    @IBOutlet var citySearchBar: UISearchBar!
    @IBOutlet var cityFilteringSegmentedControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    
    private var currentSearchText: String = ""
    private var currentFilteringOption: CityFilteringOption = .all
    private let highlightColor: UIColor = .systemRed
    
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
        = { [weak self] tableView, indexPath, itemIdentifier in
            guard let self else { fatalError() }
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "CitySearchingTableViewCell"
            ) as! CitySearchingTableViewCell
            cell.configure(with: itemIdentifier)
            cell.highlighSearchedText(self.currentSearchText, color: .systemRed)
            return cell
        }
        
        self.dataSource = CitySearchingDiffableDataSource(
            tableView: tableView,
            cellProvider: cellProvider
        )
        self.tableView.delegate = self
    }
    
    private func reloadDiffableDataSource() {
//        dataSource.applySnapshotUsingReloadData(
//            searchText: currentSearchText,
//            filteringOption: currentFilteringOption
//        )
        
        dataSource.applySnapshot(
            searchText: currentSearchText,
            filteringOption: currentFilteringOption
        ) { [weak self] in
            /// `diffableDataSource`의 경우, 움직이지 않는 셀(?)은 `cell Provider`에서 구현한
            /// `configure` 및 `highlighSearchedText` 메서드가 호출되지 않기 때문에, 특정 글자에 색을 넣는 동작이 반영되지 않음.
            /// `apply()` 메서드가 호출되어 필터링이 끝난 직후, 화면에 보이는 모든 셀에서 명시적으로 `highlight`하도록 구현함.
            guard let self else { return }
            let visibleCells = self.tableView.visibleCells as! [CitySearchingTableViewCell]
            visibleCells.forEach { cell in
                cell.highlighSearchedText(self.currentSearchText, color: self.highlightColor)
            }
        }
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

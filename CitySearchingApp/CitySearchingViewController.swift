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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
    }
    
    
}

//
//  CitySearchingTableViewController.swift
//  CitySearchingApp
//
//  Created by 김민성 on 7/15/25.
//

import UIKit

class CitySearchingTableViewController: UITableViewController {
    
    @IBOutlet var citySearchBar: UISearchBar!
    @IBOutlet var cityFilteringSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        citySearchBar.delegate = self
    }
    
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    
}


extension CitySearchingTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
}

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
    
    @IBOutlet var citySearchBar: UISearchBar!
    @IBOutlet var cityFilteringSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        citySearchBar.delegate = self
        
        let nib = UINib(nibName: "CitySearchingTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "CitySearchingTableViewCell")
        tableView.rowHeight = 170
    }
    
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = cities[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CitySearchingTableViewCell") as! CitySearchingTableViewCell
        cell.configure(with: item)
        return cell
    }
    
}


extension CitySearchingTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
}

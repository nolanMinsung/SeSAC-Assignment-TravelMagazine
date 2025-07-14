//
//  TravelInfoTableViewController.swift
//  SeSAC-Assignment-TravelMagazine
//
//  Created by 김민성 on 7/14/25.
//

import UIKit

class TravelInfoTableViewController: UITableViewController {
    
    let travelInfoPlaces = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let TravelCellNib = UINib(nibName: "TravelInfoTableViewCell", bundle: .main)
        let addCellNib = UINib(nibName: "TravelInfoTableAdCell", bundle: .main)
        tableView.register(TravelCellNib, forCellReuseIdentifier: "TravelInfoTableViewCell")
        tableView.register(addCellNib, forCellReuseIdentifier: "TravelInfoTableAdCell")
        tableView.rowHeight = UITableView.automaticDimension
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelInfoPlaces.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = travelInfoPlaces[indexPath.row]
        if item.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TravelInfoTableAdCell") as! TravelInfoTableAdCell
            cell.configure(with: item)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TravelInfoTableViewCell") as! TravelInfoTableViewCell
            cell.configure(with: travelInfoPlaces[indexPath.row])
            return cell
        }
        
    }
}

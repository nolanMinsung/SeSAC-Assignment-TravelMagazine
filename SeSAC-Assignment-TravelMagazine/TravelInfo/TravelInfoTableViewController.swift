//
//  TravelInfoTableViewController.swift
//  SeSAC-Assignment-TravelMagazine
//
//  Created by 김민성 on 7/14/25.
//

import UIKit

class TravelInfoTableViewController: UITableViewController {
    
    var travelInfoPlaces = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let TravelCellNib = UINib(nibName: "TravelInfoTableViewCell", bundle: .main)
        let addCellNib = UINib(nibName: "TravelInfoTableAdCell", bundle: .main)
        tableView.register(TravelCellNib, forCellReuseIdentifier: "TravelInfoTableViewCell")
        tableView.register(addCellNib, forCellReuseIdentifier: "TravelInfoTableAdCell")
        tableView.rowHeight = UITableView.automaticDimension
        
        navigationController?.navigationBar.tintColor = .label
    }
    
    @objc private func likeButtonTapped(_ sender: UIButton) {
        let selectedIndex = sender.tag
        travelInfoPlaces[selectedIndex].like?.toggle()
        sender.isSelected.toggle()
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
            cell.likeButton.tag = indexPath.row
            cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = travelInfoPlaces[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        if item.ad {
            let travelADViewController = storyboard.instantiateViewController(withIdentifier: "TravelADViewController") as! TravelADViewController
            travelADViewController.modalPresentationStyle = .fullScreen
            travelADViewController.adText = item.title
            present(travelADViewController, animated: true)
        } else {
            let travelPlaceDetailVC = storyboard.instantiateViewController(
                withIdentifier: "TravelPlaceDetailViewController"
            ) as! TravelPlaceDetailViewController
            travelPlaceDetailVC.travelPlace = item
            navigationItem.backButtonTitle = ""
            navigationController?.pushViewController(travelPlaceDetailVC, animated: true)
        }
        
    }
    
}

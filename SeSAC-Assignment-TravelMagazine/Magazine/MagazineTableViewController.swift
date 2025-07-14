//
//  MagazineTableViewController.swift
//  SeSAC-Assignment-TravelMagazine
//
//  Created by 김민성 on 7/13/25.
//

import UIKit

import Kingfisher

class MagazineTableViewController: UITableViewController {
    
    let magazinePosts: [Magazine] = MagazineInfo().magazine
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "MagazineCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "MagazineCell")
        tableView.rowHeight = UITableView.automaticDimension
    }
    
}

// MARK: - Table view data source
extension MagazineTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazinePosts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = magazinePosts[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MagazineCell", for: indexPath) as? MagazineCell else {
            fatalError()
        }
        cell.mainImageView.kf.setImage(with: post.imageURL)
        cell.titleLabel.text = post.title
        cell.subtitleLabel.text = post.subtitle
        cell.postDateLabel.text = post.dateInString
        
        return cell
    }
}

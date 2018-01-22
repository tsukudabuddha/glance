//
//  ViewController.swift
//  glance
//
//  Created by Andrew Tsukuda on 1/20/18.
//  Copyright © 2018 Andrew Tsukuda. All rights reserved.
//

import UIKit
import Kingfisher

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var shows: [Show] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.shows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showCell", for: indexPath) as! SearchTableViewCell
        
        // Configure the cell...
        cell.titleLabel.text = shows[indexPath.row].name
        cell.summaryLabel.text = shows[indexPath.row].summary
        
        if let imageUrl = URL(string: shows[indexPath.row].imageUrl) {
            cell.previewImageView.kf.setImage(with: imageUrl)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let show = shows[indexPath.row]
        
        /* Reference storyboard */
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "showDetailVC") as! ShowDetailViewController
        detailVC.show = show
       
        self.present(detailVC, animated: true) {
            print("CLosed detail")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            let network = Network()
            network.getShows(keyword: searchText, completion: { (shows) in
                    self.shows = shows
            })
        }
        searchBar.endEditing(true)
        
    }
    
}


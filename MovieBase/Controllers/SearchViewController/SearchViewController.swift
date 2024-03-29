//
//  SearchViewController.swift
//  testando
//
//  Created by sml on 18/07/22.
//

import UIKit

class SearchViewController: UIViewController {

    var tableViewContent: [Movie] = []

    @IBOutlet var searchBar: UISearchBar!
    var paginating: Bool = false
    var page = "2"
    var searchText = ""
    @IBOutlet var searchTableView: UITableView!
    
    @IBOutlet var noSearchText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        searchBar.delegate = self
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.barTintColor = UIColor.black
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField

        textFieldInsideSearchBar?.textColor = UIColor.white
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
}


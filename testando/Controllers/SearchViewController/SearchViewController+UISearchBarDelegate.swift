//
//  SearchViewController+UISearchBarDelegate.swift
//  testando
//
//  Created by sml on 18/07/22.
//

import UIKit

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        if searchText == "" {
            noSearchText.isHidden = false
        } else {
            noSearchText.isHidden = true
        }
        
        Task {
            self.tableViewContent = await Movie.searchMovies(searchString: searchText.lowercased())
            self.searchTableView.reloadData()
        }
    }
}

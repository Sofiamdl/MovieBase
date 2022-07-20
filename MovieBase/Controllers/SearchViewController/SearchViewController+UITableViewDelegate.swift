//
//  SeeAllViewController+UICollectionViewDelegate.swift
//  testando
//
//  Created by sml on 18/07/22.
//

import UIKit

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie:Movie = tableViewContent[indexPath.item]
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !paginating {
            let position = scrollView.contentOffset.y
            if position > searchTableView.contentSize.height-100-scrollView.frame.size.height {
                Task {
                    print("paginando")
                    paginating = true
                    var auxTableViewContent: [Movie] = await Movie.searchMovies(searchString: self.searchText, page: self.page)
                    tableViewContent = tableViewContent + auxTableViewContent
                    searchTableView.reloadData()
                    self.page = String(Int(self.page)! + 1)
                    paginating = false
                }
            }
        }
    }
    
}

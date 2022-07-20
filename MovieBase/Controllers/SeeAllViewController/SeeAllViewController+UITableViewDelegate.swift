//
//  SeeAllViewController+UICollectionViewDelegate.swift
//  testando
//
//  Created by sml on 18/07/22.
//

import UIKit

extension SeeAllViewController: UITableViewDelegate, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie:Movie = tableViewContent[indexPath.item]
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > seeAllTableView.contentSize.height-100-scrollView.frame.size.height {
            Task {
                if !paginating {
                    
                    paginating = true
                    var auxTableViewContent: [Movie]
                    if screenType == "Popular" {
                        auxTableViewContent = await Movie.paginateMovies(page: self.page, path: "/3/movie/popular")
                    } else if screenType == "Now Playing" {
                        auxTableViewContent = await Movie.paginateMovies(page: self.page, path: "/3/movie/now_playing")
                    } else {
                        auxTableViewContent = await Movie.paginateMovies(page: self.page, path: "/3/movie/upcoming")
                    }
                    tableViewContent = tableViewContent + auxTableViewContent
                    seeAllTableView.reloadData()
                    paginating = false
                    self.page = String(Int(self.page)! + 1)
                }
            }
        }
    }
    
}

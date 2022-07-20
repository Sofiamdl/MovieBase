//
//  SeeAllViewController+UICollectionViewDelegate.swift
//  testando
//
//  Created by sml on 18/07/22.
//

import UIKit

extension TrendingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movie:Movie = tableViewContent[indexPath.item]
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > trendingTableView.contentSize.height-100-scrollView.frame.size.height {
            Task {
                if !paginating {
                    paginating = true
                    var auxTableViewContent: [Movie]
                    if trendingSegmentControl.selectedSegmentIndex == 0 {
                        auxTableViewContent  = await Movie.paginateMovies(page: self.page, path: "/3/trending/movie/day")
                    } else {
                        auxTableViewContent = await Movie.paginateMovies(page: self.page, path: "/3/trending/movie/week")
                    }
                    tableViewContent = tableViewContent + auxTableViewContent
                    trendingTableView.reloadData()
                    self.page = String(Int(self.page)! + 1)
                    paginating = false
                }
            }
        }
    }
    
}

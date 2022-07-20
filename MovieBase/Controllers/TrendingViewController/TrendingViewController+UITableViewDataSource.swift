//
//  SeeAllViewController+UITableViewDataSource.swift
//  testando
//
//  Created by sml on 18/07/22.
//

import UIKit


extension TrendingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrendingCell.cellIdentifier, for: indexPath) as! TrendingCell
        let card = tableViewContent[indexPath.row]
        cell.draw(card)
        let movie = tableViewContent[indexPath.item].posterPath
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie)
            let imagem = UIImage(data: imageData) ?? UIImage()
            cell.setup(image: imagem)
        }
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !paginating {
            let position = scrollView.contentOffset.y
            if position > trendingTableView.contentSize.height-100-scrollView.frame.size.height {
                Task {
                    print("paginando")
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

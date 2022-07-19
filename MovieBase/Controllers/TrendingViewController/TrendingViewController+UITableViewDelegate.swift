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
    
    
}

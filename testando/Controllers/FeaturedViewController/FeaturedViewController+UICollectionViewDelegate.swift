//
//  FeaturedViewController+UICollectionViewDelegate.swift
//  testando
//
//  Created by sml on 13/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie: Movie
        if collectionView == popularCollectionView {
            movie = popularArray[indexPath.item]
        } else if collectionView == nowPlayingCollectionView {
            movie = nowPlayingArray[indexPath.item]
        } else {
            movie = upcomingArray[indexPath.item]
        }
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
        
    }
}

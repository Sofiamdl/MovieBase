//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  testando
//
//  Created by sml on 12/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.popularCollectionView {
            return popularArray.count
        } else if collectionView == nowPlayingCollectionView {
            return nowPlayingArray.count
        } else if collectionView == upcomingCollectionView {
            return upcomingArray.count
        }
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popularCollectionView {
            return makePopularCell(collectionView, indexPath)
        } else if collectionView == nowPlayingCollectionView {
            return makeNowPlayingCell(collectionView, indexPath)
        } else {
            return makeUpcomingCell(collectionView, indexPath)
            
        }
    }
    
    fileprivate func makePopularCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> PopularCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCell.cellIdentifier, for: indexPath) as! PopularCell
        let card = popularArray[indexPath.row]
        cell.draw(card)
        return cell
    }
    
    fileprivate func makeNowPlayingCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> NowPlayingCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCell.cellIdentifier, for: indexPath) as! NowPlayingCell
        let card = nowPlayingArray[indexPath.row]
        cell.draw(card)
        return cell
    }
    
    fileprivate func makeUpcomingCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UpcomingCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCell.cellIdentifier, for: indexPath) as! UpcomingCell
        let card = upcomingArray[indexPath.row]
        cell.draw(card)
        return cell
    }
}

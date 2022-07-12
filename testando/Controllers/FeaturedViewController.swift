//
//  ViewController.swift
//  testando
//
//  Created by sml on 04/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        popularCollectionView.dataSource = self
        
        nowPlayingCollectionView.dataSource = self
        
        upcomingCollectionView.dataSource = self
        print(popularArray)
    }

    @IBOutlet weak var popularCollectionView: UICollectionViewPopular!
    @IBOutlet weak var nowPlayingCollectionView: UICollectionViewNowPlaying!
    @IBOutlet weak var upcomingCollectionView: UICollectionViewUpcoming!
    
    let popularArray = Movie.popularMovies()
    
    let nowPlayingArray = Movie.nowPlayingMovies()
    
    let upcomingArray = Movie.upcomingMovies()

}

extension FeaturedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.popularCollectionView {
            return popularArray.count
        } else if collectionView == self.nowPlayingCollectionView {
            return nowPlayingArray.count
        } else if collectionView == self.upcomingCollectionView {
            return upcomingArray.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.popularCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCell", for: indexPath) as! PopularCell
            let card = popularArray[indexPath.row]
            cell.draw(card)
            return cell
        } else if collectionView == self.nowPlayingCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NowPlayingCell", for: indexPath) as! NowPlayingCell
            let card = nowPlayingArray[indexPath.row]
            cell.draw(card)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingCell", for: indexPath) as! UpcomingCell
            let card = upcomingArray[indexPath.row]
            cell.draw(card)
            return cell
        }
    }
}

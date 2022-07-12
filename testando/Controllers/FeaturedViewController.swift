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


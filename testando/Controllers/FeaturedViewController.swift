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
        popularCollectionView.delegate = self

        nowPlayingCollectionView.dataSource = self
        nowPlayingCollectionView.delegate = self
        
        Task {
            self.popularArray = await Movie.popularMoviesAPI()
            self.popularCollectionView.reloadData()
        }
        
        upcomingCollectionView.dataSource = self
        upcomingCollectionView.delegate = self

    }
    
    @IBOutlet weak var popularCollectionView: UICollectionViewPopular!
    @IBOutlet weak var nowPlayingCollectionView: UICollectionViewNowPlaying!
    @IBOutlet weak var upcomingCollectionView: UICollectionViewUpcoming!
    
    var popularArray = Movie.popularMovies()
    
    let nowPlayingArray = Movie.nowPlayingMovies()
    
    let upcomingArray = Movie.upcomingMovies()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
        // passar o filme adiante
    }

}


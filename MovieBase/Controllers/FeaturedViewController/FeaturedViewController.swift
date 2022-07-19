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
            self.popularArray = await Movie.listMoviesFrom(path: "/3/movie/popular")
            self.nowPlayingArray = await Movie.listMoviesFrom(path: "/3/movie/now_playing")
            self.upcomingArray = await Movie.listMoviesFrom(path: "/3/movie/upcoming" )
            self.popularCollectionView.reloadData()
            self.nowPlayingCollectionView.reloadData()
            self.upcomingCollectionView.reloadData()
            
        }
        
        upcomingCollectionView.dataSource = self
        upcomingCollectionView.delegate = self
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.barTintColor = UIColor.black
        
        tabBarController?.tabBar.barTintColor = UIColor.black
        
    }
    
    @IBOutlet weak var popularCollectionView: UICollectionViewPopular!
    @IBOutlet weak var nowPlayingCollectionView: UICollectionViewNowPlaying!
    @IBOutlet weak var upcomingCollectionView: UICollectionViewUpcoming!
    
    
    
    var popularArray:[Movie] = []
    
    var nowPlayingArray:[Movie] = []
    
    var upcomingArray:[Movie] = []
    
    @IBAction func seeAllPopular(_ sender: UIButton) {
        self.performSegue(withIdentifier: "seeAllSegue", sender: "Popular")
    }
    
    @IBAction func seeAllNowPlaying(_ sender: UIButton) {
        self.performSegue(withIdentifier: "seeAllSegue", sender: "Now Playing")
    }
    
    
    @IBAction func seeAllUpcoming(_ sender: UIButton) {
        self.performSegue(withIdentifier: "seeAllSegue", sender: "Upcoming")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        } else if let destination = segue.destination as? SeeAllViewController {
            let type = sender as? String
            destination.screenType = type
        }
        
    }
}

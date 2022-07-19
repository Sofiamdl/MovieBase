//
//  SeeAllViewController.swift
//  testando
//
//  Created by sml on 18/07/22.
//

import UIKit

class SeeAllViewController: UIViewController {
    
    @IBOutlet var seeAllTableView: UITableView!
    
    var tableViewContent: [Movie] = []
    var screenType: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let screenType = screenType else {
            return
        }
        
        self.title = screenType
        
        Task {
            if screenType == "Popular" {
                self.tableViewContent = await Movie.listMoviesFrom(path: "/3/movie/popular")
            } else if screenType == "Now Playing" {
                self.tableViewContent = await Movie.listMoviesFrom(path: "/3/movie/now_playing")
            } else {
                self.tableViewContent = await Movie.listMoviesFrom(path: "/3/movie/upcoming" )
            }
            
            self.seeAllTableView.reloadData()
        }
        
        self.seeAllTableView.delegate = self
        self.seeAllTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
}

//
//  TrendingViewController.swift
//  testando
//
//  Created by sml on 18/07/22.
//

import UIKit

class TrendingViewController: UIViewController {
    
    @IBOutlet var trendingSegmentControl: UISegmentedControl!
    
    var tableViewContent: [Movie] = []
    var paginating: Bool = false
    var page = "2"
    
    @IBOutlet var trendingTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeDataFromTableView()
        
        trendingTableView.delegate = self
        trendingTableView.dataSource = self

        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.barTintColor = UIColor.black

    }
    @IBAction func onChangeSelectedSegment(_ sender: UISegmentedControl) {
        changeDataFromTableView()
        
    }
    
    func changeDataFromTableView() {
        Task {
            if trendingSegmentControl.selectedSegmentIndex == 0 {
                self.tableViewContent = await Movie.listMoviesFrom(path: "/3/trending/movie/day")
            } else {
                self.tableViewContent = await Movie.listMoviesFrom(path: "/3/trending/movie/week")
            }
            self.trendingTableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
    

}

//
//  DetailsViewController.swift
//  testando
//
//  Created by sml on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var movie: Movie?

    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
                        posterImage.addGestureRecognizer(tapGR)
                        posterImage.isUserInteractionEnabled = true
//        print(movie)

        guard let movie = movie else {
            return
        }
        
        self.title = movie.title
        Task {
            let backdropImageData = await Movie.downloadImageData(withPath: movie.backdropPath)
            let posterImageData = await Movie.downloadImageData(withPath: movie.posterPath)

            let backdropImage = UIImage(data: backdropImageData) ?? UIImage()
            let posterImage = UIImage(data: posterImageData) ?? UIImage()

            self.backdropImage.image = backdropImage
            self.posterImage.image = posterImage
        }
        
        titleLabel.text = movie.title
        ratingLabel.text = "Rating \(movie.voteAverage)/10"
        overviewLabel.text = movie.overview
        
        // Do any additional setup after loading the view.
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            self.performSegue(withIdentifier: "officialPosterSegue", sender: movie)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? OfficialPosterViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
        // passar o filme adiante
    }
    



}

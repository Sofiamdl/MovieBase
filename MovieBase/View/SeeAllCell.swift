//
//  SeeAllCell.swift
//  testando
//
//  Created by sml on 18/07/22.
//

import UIKit

class SeeAllCell: UITableViewCell {
    static let cellIdentifier = "seeAllCell"
    @IBOutlet var title: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var rating: UILabel!
    @IBOutlet var date: UILabel!
    
    func draw(_ movie: Movie) {
        title.text = movie.title
        posterImage.image = UIImage(named: movie.posterPath)
        date.text = "\(movie.releaseDate.prefix(4))"
        rating.text = String(movie.voteAverage)
    }
    
    func setup(image: UIImage) {
        posterImage.image = image
    }
}

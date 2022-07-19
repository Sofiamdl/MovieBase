//
//  TrendingCell.swift
//  testando
//
//  Created by sml on 18/07/22.
//

import UIKit

class TrendingCell: UITableViewCell {
    static let cellIdentifier = "trendingCell"

    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var date: UILabel!

    func draw(_ movie: Movie) {
        title.text = movie.title
        posterImage.image = UIImage(named: movie.posterPath)
        date.text = "\(movie.releaseDate.prefix(4))"
    }
    
    func setup(image: UIImage) {
        posterImage.image = image
    }
}

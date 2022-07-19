//
//  SearchCell.swift
//  testando
//
//  Created by sml on 18/07/22.
//

import UIKit

class SearchCell: UITableViewCell {

    static let cellIdentifier = "searchCell"

    @IBOutlet var posterImage: UIImageView!
    
    @IBOutlet var title: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    
    func draw(_ movie: Movie) {
        title.text = movie.title
        posterImage.image = UIImage(named: movie.posterPath)
        dateLabel.text = "\(movie.releaseDate.prefix(4))"
    }
    
    func setup(image: UIImage) {
        posterImage.image = image
    }

   
}

//
//  NowPlayingCell.swift
//  testando
//
//  Created by sml on 07/07/22.
//

import UIKit

class NowPlayingCell: UICollectionViewCell {
    
    static let cellIdentifier = "NowPlayingCell"

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    func draw(_ movie: Movie) {
        title.text = movie.title
        image.image = UIImage(named: movie.poster)
        date.text = String(movie.releaseDate.prefix(4))
    }
}

//
//  NowPlayingCell.swift
//  testando
//
//  Created by sml on 07/07/22.
//

import UIKit

class NowPlayingCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    func draw(_ movie: Movie) {
        title.text = movie.title
        image.loadFrom(URLAddress: movie.image)
        date.text = movie.date
    }
}

//
//  PopularCell.swift
//  testando
//
//  Created by sml on 07/07/22.
//

import UIKit

class PopularCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    func draw(_ movie: Movie) {
        title.text = movie.title
        image.loadFrom(URLAddress: movie.poster)
    }
}
//
//  PopularCell.swift
//  testando
//
//  Created by sml on 07/07/22.
//

import UIKit

class PopularCell: UICollectionViewCell {
    
    static let cellIdentifier = "PopularCell"
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    func draw(_ movie: Movie) {
        title.text = movie.title
        image.image = UIImage()
    }
    
    func setup(_ title: String, image: UIImage) {
        self.title.text = title
        self.image.image = image
    }
}

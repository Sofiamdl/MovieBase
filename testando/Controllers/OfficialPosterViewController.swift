//
//  OfficialPosterViewController.swift
//  testando
//
//  Created by sml on 17/07/22.
//

import UIKit

class OfficialPosterViewController: UIViewController {
    var movie: Movie?

    @IBOutlet var officialPosterImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let movie = movie else {
            return
        }
        
        Task {
            let posterImageData = await Movie.downloadImageData(withPath: movie.posterPath)

            let posterImage = UIImage(data: posterImageData) ?? UIImage()

            self.officialPosterImage.image = posterImage
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

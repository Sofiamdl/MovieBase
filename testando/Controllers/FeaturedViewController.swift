//
//  ViewController.swift
//  testando
//
//  Created by sml on 04/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        
        nowPlayingCollectionView.dataSource = self
        nowPlayingCollectionView.delegate = self
        
        upcomingCollectionView.dataSource = self
        upcomingCollectionView.delegate = self
    }

    @IBOutlet weak var popularCollectionView: UICollectionViewPopular!
    @IBOutlet weak var nowPlayingCollectionView: UICollectionViewNowPlaying!
    @IBOutlet weak var upcomingCollectionView: UICollectionViewUpcoming!
    
    var popularArray: [Movie] = [Movie(backdrop: "https://ingresso-a.akamaihd.net/prd/img/movie/sonic-2/fde04f56-1afb-4c71-9ff2-97dac723f8d8.jpg", poster: "https://ingresso-a.akamaihd.net/prd/img/movie/sonic-2/fde04f56-1afb-4c71-9ff2-97dac723f8d8.jpg", title: "Harry potter 1", voteAverage: 4.5, releaseDate: "2001", overview: "Um bruxinho vai pra escola de magia <3. Altas aventuras.", genres: ["Fantasia", "Ação", "Mistério"])]
    var nowPlayingArray: [Movie] = [Movie(backdrop: "https://ingresso-a.akamaihd.net/prd/img/movie/sonic-2/fde04f56-1afb-4c71-9ff2-97dac723f8d8.jpg", poster: "https://ingresso-a.akamaihd.net/prd/img/movie/sonic-2/fde04f56-1afb-4c71-9ff2-97dac723f8d8.jpg", title: "Harry potter 1", voteAverage: 4.5, releaseDate: "2001", overview: "Um bruxinho vai pra escola de magia <3. Altas aventuras.", genres: ["Fantasia", "Ação", "Mistério"])]
    var upcomingArray: [Movie] = [Movie(backdrop: "https://ingresso-a.akamaihd.net/prd/img/movie/sonic-2/fde04f56-1afb-4c71-9ff2-97dac723f8d8.jpg", poster: "https://ingresso-a.akamaihd.net/prd/img/movie/sonic-2/fde04f56-1afb-4c71-9ff2-97dac723f8d8.jpg", title: "Harry potter 1", voteAverage: 4.5, releaseDate: "2001", overview: "Um bruxinho vai pra escola de magia <3. Altas aventuras.", genres: ["Fantasia", "Ação", "Mistério"])]
}

extension FeaturedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.popularCollectionView {
            return popularArray.count
        } else if collectionView == self.nowPlayingCollectionView {
            return nowPlayingArray.count
        } else if collectionView == self.upcomingCollectionView {
            return upcomingArray.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.popularCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCell", for: indexPath) as! PopularCell
            let card = popularArray[indexPath.row]
            cell.draw(card)
            return cell
        } else if collectionView == self.nowPlayingCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NowPlayingCell", for: indexPath) as! NowPlayingCell
            let card = nowPlayingArray[indexPath.row]
            cell.draw(card)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingCell", for: indexPath) as! UpcomingCell
            let card = upcomingArray[indexPath.row]
            cell.draw(card)
            return cell
        }
    }
}

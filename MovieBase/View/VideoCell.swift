//
//  VideoCell.swift
//  MovieBase
//
//  Created by sml on 19/07/22.
//

import UIKit
import youtube_ios_player_helper

class VideoCell: UICollectionViewCell, YTPlayerViewDelegate {
    static let cellIdentifier = "videoCell"
    @IBOutlet var videoPlayer: YTPlayerView!
    
    @IBOutlet var movieLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    func draw(_ video: Video) {
        videoPlayer.delegate = self
       
        movieLabel.text = video.name
        videoPlayer.load(withVideoId: video.key)
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.duration { (duration, error) in
            self.timeLabel.text = "\(String(format: "%02d",Int(duration)/60)):\(String(format: "%02d",Int(duration)%60))"
        }
    }
}

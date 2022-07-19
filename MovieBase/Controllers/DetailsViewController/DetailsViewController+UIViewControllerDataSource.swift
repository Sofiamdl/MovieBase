//
//
//
//  Created by sml on 19/07/22.
//

import UIKit

extension DetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videosContent.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCell.cellIdentifier, for: indexPath) as! VideoCell
        let card = videosContent[indexPath.row]
        cell.draw(card)
        return cell
    }
}

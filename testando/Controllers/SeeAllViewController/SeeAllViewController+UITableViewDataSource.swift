//
//  SeeAllViewController+UITableViewDataSource.swift
//  testando
//
//  Created by sml on 18/07/22.
//

import UIKit


extension SeeAllViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "seeAllCell", for: indexPath) as! SeeAllCell
        let card = tableViewContent[indexPath.row]
        cell.draw(card)
        let movie = tableViewContent[indexPath.item].posterPath
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie)
            let imagem = UIImage(data: imageData) ?? UIImage()
            cell.setup(image: imagem)
        }
        return cell
    }
    
    
}

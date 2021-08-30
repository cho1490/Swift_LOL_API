//
//  GraphCell.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/21.
//

import UIKit
import Then
import SDWebImage

class GraphCell: UICollectionViewCell {
    
    static let identifier = "GraphCellIdentifier"
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    func configureUI(championID: Int) {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        settingCell(championID: championID)
    }
    
    func settingCell(championID: Int) {
        if let url = URL(string: DATA_DRAGON.getChampion.getURL(subString: Converter.getChampionName(championID: championID))) {
            imageView.sd_setImage(with: url, completed: nil)
        }
    }
    
}

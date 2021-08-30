//
//  BanCell.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/25.
//

import UIKit
import Then
import SDWebImage

class BanCell: UICollectionViewCell {
    
    static let identifier = "BanCellIdentifier"
    
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
        if championID == -1 {
            imageView.image = UIImage(named: "Ban")
        } else {
            if let url = URL(string: DATA_DRAGON.getChampion.getURL(subString: Converter.getChampionName(championID: championID))) {
                imageView.sd_setImage(with: url, completed: nil)
            }
        }
    }
    
}

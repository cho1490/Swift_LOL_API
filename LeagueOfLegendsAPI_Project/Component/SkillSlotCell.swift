//
//  SkillSlotCell.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/26.
//

import UIKit
import Then

class SkillSlotCell: UICollectionViewCell {
    
    static let identifier = "SkillSlotCellIdentifier"
    
    let skillSlotLabel = UILabel().then {
        $0.font = $0.font.withSize(14)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    let levelView = UIView().then {
        $0.backgroundColor = Constant.Color.MY_GREY
    }
    
    let levelLabel = UILabel().then {
        $0.font = $0.font.withSize(9)
        $0.textColor = .black
        $0.textAlignment = .center
    }
   
    func configureUI(index: Int, skillSlot: Int) {
        addSubview(skillSlotLabel)
        skillSlotLabel.translatesAutoresizingMaskIntoConstraints = false
        skillSlotLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        skillSlotLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        skillSlotLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        skillSlotLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
   
        addSubview(levelView)
        levelView.translatesAutoresizingMaskIntoConstraints = false
        levelView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        levelView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        let levelViewWidth = frame.width / 4
        levelView.widthAnchor.constraint(equalToConstant: levelViewWidth).isActive = true
        levelView.heightAnchor.constraint(equalToConstant: levelViewWidth).isActive = true
        levelView.layer.cornerRadius = levelViewWidth / 5
        //levelView.clipsToBounds = true
        
        addSubview(levelLabel)
        levelLabel.translatesAutoresizingMaskIntoConstraints = false
        levelLabel.centerXAnchor.constraint(equalTo: levelView.centerXAnchor).isActive = true
        levelLabel.centerYAnchor.constraint(equalTo: levelView.centerYAnchor).isActive = true
        
        settingTopCell(index: index, skillSlot: skillSlot)
    }
    
    func settingTopCell(index: Int, skillSlot: Int) {
        levelLabel.text = "\(index + 1)"
        
        switch skillSlot {
        case 1:
            skillSlotLabel.text = "Q"
        case 2:
            skillSlotLabel.text = "W"
        case 3:
            skillSlotLabel.text = "E"
        case 4:
            skillSlotLabel.text = "R"
        default:
            skillSlotLabel.text = "?"
        }
    
        backgroundColor = Constant.Color.MY_BLUE
    }
  
}

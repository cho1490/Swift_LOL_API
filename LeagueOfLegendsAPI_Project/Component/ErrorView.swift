//
//  ErrorView.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/29.
//

import UIKit
import Then

class ErrorView: UIView {
    
    let imageView = UIImageView().then {
        $0.image = UIImage(named: "Error")
        $0.heightAnchor.constraint(equalToConstant: 70).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    let errorCode = UILabel().then {
        $0.font = $0.font.withSize(12)
    }

    let discriptionLabel = UILabel().then {
        $0.font = $0.font.withSize(12)
        $0.numberOfLines = 0
    }
    
    let button = UIButton().then {
        $0.backgroundColor = Constant.Color.MY_BLUE
        $0.setTitle("확인", for: .normal)
        $0.layer.cornerRadius = 6
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 60).isActive = true
        $0.addTarget(self, action: #selector(okButtonTapped), for: UIControl.Event.touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Constant.Color.MY_BACKGROUND
        layer.cornerRadius = 30
        layer.borderWidth = 1
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(errorCode)
        errorCode.translatesAutoresizingMaskIntoConstraints = false
        errorCode.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        errorCode.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(discriptionLabel)
        discriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        discriptionLabel.topAnchor.constraint(equalTo: errorCode.bottomAnchor, constant: 45).isActive = true
        discriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        discriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        discriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func settingView(discription: String) {
        errorCode.text = "Error"
        
        discriptionLabel.text = "\(discription)"
    }
    
    @objc func okButtonTapped() {
        removeFromSuperview()
    }
    
}

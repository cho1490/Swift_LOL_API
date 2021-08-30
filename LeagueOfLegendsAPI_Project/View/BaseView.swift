//
//  BaseView.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/02.
//

import UIKit

class BaseView: UIView {
    
    let loadingView = LoadingView()
  
    let errorView = ErrorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBackgournd()
        configureUI()
    }
      
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBackgournd() {
        overrideUserInterfaceStyle = .light
        backgroundColor = .systemBackground
    }
    
    func configureUI() {
        
    }

}

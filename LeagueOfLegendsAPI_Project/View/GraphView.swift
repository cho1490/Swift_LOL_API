//
//  DamageView.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/17.
//

import UIKit
import Charts

class GraphView: BaseView {
    
    let barChartView = BarChartView()
    
    let collectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .systemBackground
        
        return cv
    }()

    override func configureUI() {
        addSubview(barChartView)
        barChartView.translatesAutoresizingMaskIntoConstraints = false
        barChartView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        barChartView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        barChartView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        barChartView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -140).isActive = true
        barChartView.noDataText = "No Data"
        barChartView.doubleTapToZoomEnabled = false
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: barChartView.bottomAnchor, constant: 20).isActive = true
        collectionView.leftAnchor.constraint(equalTo: barChartView.leftAnchor, constant: 15).isActive = true
        collectionView.rightAnchor.constraint(equalTo: barChartView.rightAnchor, constant: -15).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
}

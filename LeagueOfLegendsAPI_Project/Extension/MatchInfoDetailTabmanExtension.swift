//
//  MatchInfoDetailTabmanExtension.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/17.
//

import Foundation
import Tabman
import Pageboy

extension MatchInfoDetailTabmanViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "점수표")
        case 1:
            return TMBarItem(title: "그래프")
        case 2:
            return TMBarItem(title: "빌드")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
    
    }
    
}

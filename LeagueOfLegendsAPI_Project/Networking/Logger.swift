//
//  Logger.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/07/27.
//

import Foundation
import Alamofire

final class Logger: EventMonitor {
    
    let queue = DispatchQueue(label: "API_LOG")
    
    /*
    func requestDidResume(_ request: Request) {
        print("Logger.requestDidResume()")
        print(request)
    }
    */
    
    func request(_ request: DataRequest, didParseResponse response: DataResponse<Data?, AFError>) {
        print("Logger.request()")
        
        guard let statusCode = request.response?.status else { return }
        print("Logger.asURLRequest() : statusCode = \(statusCode)")

    }
    
}

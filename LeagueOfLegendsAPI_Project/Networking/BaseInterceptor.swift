//
//  BaseInterceptor.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/07/27.
//

import Foundation
import Alamofire

class BaseInterceptor: RequestInterceptor {

    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        print("Interceptor.adapt()")
        
        var request = urlRequest
        request.addValue(API.KEY, forHTTPHeaderField: "X-Riot-Token")
        
        completion(.success(request))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        print("Interceptor.retry()")
        
        guard let statusCode = request.response?.statusCode else {
            completion(.doNotRetry)
            return
        }
        print("Interceptor.retry() : statusCode = \(statusCode)")
        
        completion(.doNotRetry)
    }
    
}

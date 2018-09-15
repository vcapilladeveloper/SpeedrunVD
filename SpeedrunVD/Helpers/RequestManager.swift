//
//  RequestManager.swift
//  SpeedrunVD
//
//  Created by Victor Capilla Developer on 14/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

// Manager to make the request to the API
// In this project all request are GET Type

final class RequestManager: NSObject {
    static var defaultSession: URLSession!
    static var dataGetTask: URLSessionDataTask?
    
    typealias RequestResult = (_ data: Data?, _ error: (Bool, String?)) -> Void
    
    class func getResults(from url: URL, completionHandler: @escaping RequestResult) {
        dataGetTask?.cancel()
        defaultSession = URLSession(configuration: .default)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        defer { dataGetTask?.resume() }
        dataGetTask = defaultSession.dataTask(with: urlRequest) { data, response, error in
            defer { self.dataGetTask = nil }
            if let error = error {
                completionHandler(data, (true, error.localizedDescription))
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode >= 200, response.statusCode <= 300 {
                completionHandler(data, (false, nil))
            } else {
                completionHandler(nil, (true, nil))
            }
        }
    }
}

//
//  CodableEngine.swift
//  SpeedrunVD
//
//  Created by Victor Capilla Developer on 13/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

// Class in charge of take result from request and convert in data that whe need.
// The use of Generic is to specify in each request, the type of data we need to get.
final class CodableEngine {
    func genericConvert<T: Codable>(_ data: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = data else {
            return nil
        }
        do {
            let genericData = try decoder.decode(T.self, from: data)
            return genericData
        } catch {
            return nil
        }
    }
}

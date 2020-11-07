//
//  Model.swift
//  Youtube App
//
//  Created by Sai Naveen Katla on 05/10/20.
//

import Foundation

protocol VideoData {
    func gotdata(_ Model: Model,_ videos: [Video])
}

class Model {
    
    var delegate: VideoData?
    
    let Url = Constants.url
    
    func perform() {
        if let url = URL(string: Url) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    if let response = response as? HTTPURLResponse {
                        print(response.statusCode)
                    }
                    if let safeData = data {
                        self.parseData(safeData)
                    }
                }
                else {
                    print("error: \(error!)")
                }
            }
            task.resume()
        }
        
    }
    
    func parseData(_ data: Data) {
        let decoder = JSONDecoder()
        // date decoder
        decoder.dateDecodingStrategy = .iso8601
        do {
            let decodedData = try decoder.decode(Response.self, from: data)
            if let videos = decodedData.items {
                self.delegate?.gotdata(self, videos)
            }
        }
        catch {
            print(error)
        }
        
        
    }
    
    
}

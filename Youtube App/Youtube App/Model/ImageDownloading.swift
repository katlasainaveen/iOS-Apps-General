//
//  ImageDownloading.swift
//  Youtube App
//
//  Created by Sai Naveen Katla on 06/10/20.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func loadImageFromURL(_ url: String) {
        
        self.image = nil
        
        if let cachedImage = imageCache.object(forKey: url as NSString) {
            self.image = cachedImage
        }
        
        if let Url = URL(string: url) {
            let session = URLSession.shared
            let task = session.dataTask(with: Url) { (data, response, error) in
                if error != nil && data != nil {
                    print(error!)
                }
                else {
                    DispatchQueue.main.async {
                        imageCache.setObject(UIImage(data: data!)!, forKey: url as NSString)
                        self.image = UIImage(data: data!)
                    }
                }
            }
            task.resume()
        }
    }
    
    
}

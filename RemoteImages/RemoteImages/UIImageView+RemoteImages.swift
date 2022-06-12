//
//  UIImageView+RemoteImages.swift
//  RemoteImages
//
//  Created by Sagar Kadam on 12/06/22.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    @discardableResult
    func loadImageFromURL(urlString: String, placeHolder: UIImage?  = nil) -> URLSessionDataTask? {
        self.image = nil
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            self.image = cachedImage
            return nil
        }
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        if let placeHolder = placeHolder {
            self.image = placeHolder
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            
            DispatchQueue.main.async {
                if let data = data, let downloadedImage = UIImage(data: data) {
                    imageCache.setObject(downloadedImage, forKey: NSString(string: urlString))
                    self.image = downloadedImage
                }
            }
        }
        
        task.resume()
        return task
    }
    
    
}

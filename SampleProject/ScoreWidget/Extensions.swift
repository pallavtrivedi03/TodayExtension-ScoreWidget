//
//  Extensions.swift
//  ScoreWidget
//
//  Created by Pallav Trivedi on 15/01/18.
//  Copyright © 2018 Pallav Trivedi. All rights reserved.
//

import Foundation
import UIKit



extension UIView {
    /** Loads instance from nib with the same name. */
   
    class func loadNib<T:UIView>() -> T {
        let bundle = Bundle(for: T.self)
        let nibName = T.description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: T.self, options: nil).first as! T
    }
}

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

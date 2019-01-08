//
//  UIMageViewExtension.swift
//  RandomMe
//
//  Created by Amuri Arun Kumar on 1/7/19.
//  Copyright © 2019 Amuri Arun Kumar. All rights reserved.
//

import Foundation
import UIKit
extension UIImageView {
    //Lazyloading for UIImageview
    func downloadImageFrom(link:String, contentMode: UIView.ContentMode) {
        URLSession.shared.dataTask( with: URL(string:link)! as URL, completionHandler: {
            (data, response, error) -> Void in
            DispatchQueue.main.async {
                self.contentMode =  contentMode
                if let data = data { self.image = UIImage(data: data) }
            }
        }).resume()
    }
}

//
//  URLImageVD.swift
//  ToolsVD
//
//  Created by Victor Capilla Studiogenesis on 17/9/18.
//  Copyright © 2018 Victor Capilla Studiogenesis. All rights reserved.
//

import UIKit
import ToolsVD

class URLImageVD: UIImageView {
    
    public var placeholderImage : UIImage?
    
    public var url : NSURL? {
        didSet {
            self.image = placeholderImage
            if let urlString = url?.absoluteString {
                ImageLoaderVD.sharedLoader.imageForUrl(urlString: urlString) { [weak self] image, url in
                    if let strongSelf = self {
                        DispatchQueue.main.async(execute: { () -> Void in
                            if strongSelf.url?.absoluteString == url {
                                strongSelf.image = image ?? strongSelf.placeholderImage
                            }
                        })
                    }
                }
            }
        }
    }
    
    public func setURL(url: NSURL?, placeholderImage: UIImage?) {
        self.placeholderImage = placeholderImage
        self.url = url
    }
    
}


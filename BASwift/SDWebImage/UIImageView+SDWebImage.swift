//
//  UIImageView+IXBase.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 04/10/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//
import SDWebImage
import UIKit

// MARK: - UIImageView
extension UIImageView: ImageViewLoader {

    // MARK: - Methods
    public func setImage(withURLString urlString: String, isShowIndicator: Bool = false) {
        if let url = URL(string: urlString) {
            self.sd_setShowActivityIndicatorView(isShowIndicator)
            self.sd_setImage(with: url)
        }

    }

    public func setImage(withURLString urlString: String, placeholder: UIImage, isShowIndicator: Bool = false) {
        if let url = URL(string: urlString) {
            self.sd_setShowActivityIndicatorView(isShowIndicator)
            self.sd_setImage(with: url, placeholderImage: placeholder)
        } else {
            self.image = placeholder
        }

    }

}

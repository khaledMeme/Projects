//
//  UIImageViewWithMask.swift
//  imageMask
//
//  Created by Khaled Meme on 1/14/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit

@IBDesignable
class UIImageViewWithMask: UIImageView {
    var imageToMaskView = UIImageView()
    var maskingImageView = UIImageView()
    @IBInspectable
    var shadowOpacity: Float = 0 {
        didSet{
            layer.shadowOpacity = shadowOpacity
        }
    }
    @IBInspectable
    var shadowColor: UIColor = UIColor.clear {
        didSet{
            layer.shadowColor = shadowColor.cgColor
        }
    }
    @IBInspectable
    var shadowRadius: CGFloat = 0 {
        didSet{
            layer.shadowRadius = shadowRadius
        }
    }
    @IBInspectable
    var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet{
            layer.shadowOffset = shadowOffset
        }
    }
    @IBInspectable
    var ImageToMask: UIImage? {
        didSet{
            imageToMaskView.image = ImageToMask
            update()
        }
    }
    func update() {
        imageToMaskView.frame = bounds
        imageToMaskView.contentMode = .scaleAspectFit
        
        maskingImageView.image = image
        maskingImageView.frame = bounds
        maskingImageView.contentMode = .center
        
        imageToMaskView.layer.mask = maskingImageView.layer
        addSubview(imageToMaskView)
    }
   
}

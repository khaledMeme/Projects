//
//  IBDesignableView.swift
//  imageMask
//
//  Created by Khaled Meme on 1/15/20.
//  Copyright © 2020 Khaled Meme. All rights reserved.
//

import UIKit
@IBDesignable
class IBDesignableView: UIView {
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }

}

//
//  RadialGradient.swift
//  NEEDZ
//
//  Created by Khaled Meme on 1/18/20.
//  Copyright © 2020 com.Islam Swira. All rights reserved.
//

import UIKit
@IBDesignable
class RadialGradient: UIView {
    
    @IBInspectable
    var radialIsideColor: UIColor = UIColor.clear
    @IBInspectable
    var radialOutsideColor: UIColor = UIColor.clear
    @IBInspectable
    var xPoint: CGFloat = 0.0
    @IBInspectable
    var yPoint: CGFloat = 0.0
    @IBInspectable
    var radius: CGFloat = 0.0
    override func draw(_ rect: CGRect) {
        let colors = [radialIsideColor.cgColor,radialOutsideColor.cgColor] as CFArray
        let endRadius =  radius
        let center = CGPoint(x: xPoint, y: yPoint)
        let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: nil)
        UIGraphicsGetCurrentContext()!.drawRadialGradient(gradient!, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: endRadius, options: CGGradientDrawingOptions.drawsBeforeStartLocation)
    }
}

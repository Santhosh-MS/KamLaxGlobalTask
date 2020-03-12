//
//  commonUtility.swift
//  KamLaxTask
//
//  Created by Ducont on 23/02/20.
//  Copyright © 2020 Ducont. All rights reserved.
//

import Foundation
import UIKit
// MARK: - Setting Alert View Controller
extension UIColor{
    struct Common {
        static var tint = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        static var text = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        static var tableSeparator = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        static var tableSectionBackground = #colorLiteral(red: 0.9098039216, green: 0.9098039216, blue: 0.9098039216, alpha: 1)
        static var viewBackground = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
    }
}
open class Spinner{
   internal static var spinner: UIActivityIndicatorView?
    public static var style: UIActivityIndicatorView.Style = .whiteLarge
    public static var baseBackColor = UIColor.black.withAlphaComponent(0.4)
    public static var baseColor = UIColor.Common.tint
    
    public static func start(style: UIActivityIndicatorView.Style = style, backColor: UIColor = baseBackColor, baseColor: UIColor = baseColor){
        if spinner == nil, let window = UIApplication.shared.keyWindow{
            let frame = UIScreen.main.bounds
             spinner = UIActivityIndicatorView(frame: frame)
                       spinner!.backgroundColor = backColor
                        spinner!.style = style
                       spinner?.color = baseColor
                       window.addSubview(spinner!)
                       spinner!.startAnimating()
        }
        
    }
    
    public static func stop() {
        if spinner != nil {
            spinner!.stopAnimating()
            spinner!.removeFromSuperview()
            spinner = nil
        }
    }
    
    @objc public static func update() {
        if spinner != nil {
            stop()
            start()
        }
    }
    
}

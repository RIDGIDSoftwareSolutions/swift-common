//
//  UIViewSpinnerExtensions.swift
//  SwiftCommon
//
//  Created by Grant Hughes on 11/5/14.
//  Copyright (c) 2014 RIDGID. All rights reserved.
//

import UIKit

private let spinnerTag = 451

extension UIView {
    
    func showSpinner() {
        if(nil != getSpinner()) {
            return
        }
        
        let screenBounds = UIScreen.mainScreen().bounds
        let xPosition = (screenBounds.size.width - 25) / 2
        let yPosition = (screenBounds.size.height - 25) / 2
        
        let spinner = UIActivityIndicatorView(frame: CGRect(x: xPosition, y: yPosition, width: 50, height: 50))
        spinner.color = UIColor.grayColor()
        spinner.tag = spinnerTag
        spinner.startAnimating()
        
        self.addSubview(spinner)
    }
    
    func hideSpinner() {
        if let activityIndicator = getSpinner() {
            activityIndicator.removeFromSuperview()
        }
    }
    
    private func getSpinner() -> UIActivityIndicatorView? {
        let activityIndicators = self.subviews.filter { $0.tag == spinnerTag }
        if(activityIndicators.count == 0) {
            return nil
        }
        
        return activityIndicators[0] as? UIActivityIndicatorView
    }
}
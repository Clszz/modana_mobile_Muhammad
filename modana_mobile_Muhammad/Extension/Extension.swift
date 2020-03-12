//
//  Extension.swift
//  modana_mobile_Muhammad
//
//  Created by Muhammad Reynaldi on 12/03/20.
//  Copyright © 2020 -. All rights reserved.
//

import UIKit

extension UIView{
    func outerRound() {
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
}

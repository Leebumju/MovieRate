//
//  ButtonWithShadow.swift
//  PrographyQuest
//
//  Created by 이범준 on 2022/02/10.
//

import UIKit

class ButtonWithShadow: UIButton {

    override func draw(_ rect: CGRect) {
        updateLayerProperties()
    }
    
    func updateLayerProperties() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 5
        self.layer.masksToBounds = false
    }

}

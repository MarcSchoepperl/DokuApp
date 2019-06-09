//
//  MenuButton.swift
//  DokuApp
//
//  Created by Marc Schöpperl on 02.06.19.
//  Copyright © 2019 Marc Schöpperl. All rights reserved.
//

import UIKit

class MenuButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        backgroundColor = .clear
        layer.cornerRadius = 5
        layer.backgroundColor = UIColor.gray.cgColor
    }
    
    func onClick() {
        layer.backgroundColor = UIColor.orange.cgColor
        RunLoop.current.run(until: Date() + 0.2)
        layer.backgroundColor = UIColor.gray.cgColor
        
    }

}

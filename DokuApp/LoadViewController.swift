//
//  LoadViewController.swift
//  DokuApp
//
//  Created by Marc Schöpperl on 30.05.19.
//  Copyright © 2019 Marc Schöpperl. All rights reserved.
//

import UIKit

class LoadViewController: UIViewController {

    @IBOutlet weak var LoadProgress: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for i in  0...100 {
            LoadProgress.progress = 0.01*Float(i)
            RunLoop.current.run(until: Date() + 0.01)
        }
        RunLoop.current.run(until: Date() + 0.5)
        if(UIDevice.current.orientation.isLandscape){
            performSegue(withIdentifier: "LoadMain", sender: self)
        } else {
            performSegue(withIdentifier: "LoadMenu", sender: self)
        }
    }

}

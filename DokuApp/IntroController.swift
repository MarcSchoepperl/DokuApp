//
//  IntroController.swift
//  DokuApp
//
//  Created by Marc Schöpperl on 27.05.19.
//  Copyright © 2019 Marc Schöpperl. All rights reserved.
//

import UIKit

class IntroController: UIViewController {

    @IBOutlet weak var LoadingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.animateLoad()
    }
    
    func animateLoad() {
        LoadingLabel.text = "Loading"
        RunLoop.current.run(until: Date() + 1)
        LoadingLabel.text = "Loading."
        RunLoop.current.run(until: Date() + 1)
        LoadingLabel.text = "Loading.."
        RunLoop.current.run(until: Date() + 1)
        LoadingLabel.text = "Loading..."
        RunLoop.current.run(until: Date() + 1)
        //Thread.sleep(forTimeInterval: 2.0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

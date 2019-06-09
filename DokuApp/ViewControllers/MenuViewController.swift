//
//  MenuViewController.swift
//  DokuApp
//
//  Created by Marc Schöpperl on 02.06.19.
//  Copyright © 2019 Marc Schöpperl. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var LoadButton: MenuButton!
    @IBOutlet weak var ClearButton: MenuButton!
    @IBOutlet weak var SaveButton: MenuButton!
    
    @IBAction func OnClickLoad(_ sender: MenuButton) {
        LoadButton.onClick()
    }
    @IBAction func onClickSave(_ sender: MenuButton) {
        SaveButton.onClick()
    }
    @IBAction func onClickClear(_ sender: MenuButton) {
        ClearButton.onClick()
        GlobalBauvorhaben = ""
        GlobalGewerk = ""
        GlobalSektor = ""
        GlobalEbene = ""
        GlobalNutzung = ""
        GlobalRaum = ""
        GlobalMangel = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        UIView.setAnimationsEnabled(false)
        super.viewWillTransition(to: size, with: coordinator)
        if (UIDevice.current.orientation.isLandscape){            
            performSegue(withIdentifier: "LoadMain", sender: self)
        }
        coordinator.notifyWhenInteractionChanges {_ in UIView.setAnimationsEnabled(true)}
    }
    
}

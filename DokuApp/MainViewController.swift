//
//  MainViewController.swift
//  DokuApp
//
//  Created by Marc Schöpperl on 30.05.19.
//  Copyright © 2019 Marc Schöpperl. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var FieldBauvorhaben: MSTextField!
    @IBOutlet weak var FieldGewerk: MSTextField!
    @IBOutlet weak var FieldSektor: MSTextField!
    @IBOutlet weak var FieldEbene: MSTextField!
    @IBOutlet weak var FieldNutzung: MSTextField!
    @IBOutlet weak var FieldMangel: NumberField!
    @IBOutlet weak var FieldRaum: NumberField!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(FieldBauvorhaben.GetCount(pickerView: pickerView)>=0){
            return FieldBauvorhaben.GetCount(pickerView: pickerView)
        }
        if(FieldGewerk.GetCount(pickerView: pickerView)>=0){
            return FieldGewerk.GetCount(pickerView: pickerView)
        }
        if(FieldSektor.GetCount(pickerView: pickerView)>=0){
            return FieldSektor.GetCount(pickerView: pickerView)
        }
        if(FieldEbene.GetCount(pickerView: pickerView)>=0){
            return FieldEbene.GetCount(pickerView: pickerView)
        }
        if(FieldNutzung.GetCount(pickerView: pickerView)>=0){
            return FieldNutzung.GetCount(pickerView: pickerView)
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch(pickerView){
        case FieldBauvorhaben.Picker:
            return FieldBauvorhaben.GetItem(Row: row)
        case FieldGewerk.Picker:
            return FieldGewerk.GetItem(Row: row)
        case FieldSektor.Picker:
            return FieldSektor.GetItem(Row: row)
        case FieldEbene.Picker:
            return FieldEbene.GetItem(Row: row)
        case FieldNutzung.Picker:
            return FieldNutzung.GetItem(Row: row)
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        FieldBauvorhaben.SetText(pickerView: pickerView, Row: row)
        FieldGewerk.SetText(pickerView: pickerView, Row: row)
        FieldSektor.SetText(pickerView: pickerView, Row: row)
        FieldEbene.SetText(pickerView: pickerView, Row: row)
        FieldNutzung.SetText(pickerView: pickerView, Row: row)
        self.view.endEditing(false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FieldBauvorhaben.DropDownList = ["KönigsTOR - Viertelszentrum Königswiesen Nord", "WBW - Wohnbau St. Wolfgang "]
        FieldGewerk.DropDownList = ["Baumeister","Malerarbeiten","Estricharbeiten"]
        FieldSektor.DropDownList = ["A","B","C","D","E"]
        FieldEbene.DropDownList = ["-3","-2","-1","0","+1","+2","+3","+4","+5","+6","+7","+8","+9","+10"]
        FieldNutzung.DropDownList = ["Raum", "Wohnung","Sonstiges"]
        
        FieldBauvorhaben.Picker.delegate = self
        FieldBauvorhaben.Picker.dataSource = self
        
        FieldGewerk.Picker.delegate = self
        FieldGewerk.Picker.dataSource = self
        
        FieldSektor.Picker.delegate = self
        FieldSektor.Picker.dataSource = self
        
        FieldEbene.Picker.delegate = self
        FieldEbene.Picker.dataSource = self
        
        FieldNutzung.Picker.delegate = self
        FieldNutzung.Picker.dataSource = self
        
        FieldMangel.delegate = self
        FieldMangel.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        
        FieldRaum.delegate = self
        FieldRaum.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        
        FieldBauvorhaben.text = GlobalBauvorhaben
        FieldGewerk.text = GlobalGewerk
        FieldSektor.text = GlobalSektor
        FieldEbene.text = GlobalEbene
        FieldNutzung.text = GlobalNutzung
        FieldRaum.text = GlobalRaum
        FieldMangel.text = GlobalMangel
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        if(textFieldText.count>=4){
            textField.endEditing(true)
        }
        return count <= 4
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if (UIDevice.current.orientation.isPortrait){
            GlobalBauvorhaben = FieldBauvorhaben.text ?? ""
            GlobalGewerk = FieldGewerk.text ?? ""
            GlobalSektor = FieldSektor.text ?? ""
            GlobalEbene = FieldEbene.text ?? ""
            GlobalNutzung = FieldNutzung.text ?? ""
            GlobalRaum = FieldRaum.text ?? ""
            GlobalMangel = FieldMangel.text ?? ""
            performSegue(withIdentifier: "LoadMenu", sender: self)
        }
    }

}

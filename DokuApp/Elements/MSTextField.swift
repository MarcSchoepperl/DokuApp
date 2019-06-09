//
//  MSTextField.swift
//  DokuApp
//
//  Created by Marc Schöpperl on 25.05.19.
//  Copyright © 2019 Marc Schöpperl. All rights reserved.
//

import UIKit

class MSTextField: UITextField {
    
    var Picker = UIPickerView()
    var DropDownList = ["1","2","3"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        SetupTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        SetupTextField()
    }
    
    public func GetListCount() -> Int {
        return DropDownList.count
    }
    
    public func GetItem(Row: Int) -> String {
        return DropDownList[Row]
    }
    
    public func GetCount(pickerView: UIPickerView) -> Int {
        if(pickerView == Picker){
            return DropDownList.count
        }
        return -1
    }
    
    public func SetText(pickerView: UIPickerView, Row: Int) {
        if(pickerView == Picker){
            self.text = DropDownList[Row]
        }
    }
    
    private func SetupTextField() {
        self.inputView = Picker
    }
}

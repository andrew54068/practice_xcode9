//
//  extension.swift
//  practice
//
//  Created by kidnapper on 21/11/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import Foundation
import UIKit



extension UITableViewController{
    
    func showPickerView(PickerView: pickerView, selectionView: selectionView, type: Int, lastSelected: [String]){
        tableView.isScrollEnabled = false
//        PickerView.pickerView.reloadAllComponents()
        switch type {
        case kindOfPickerView.congress.rawValue:
            PickerView.result = lastSelected
            PickerView.selected = kindOfPickerView.congress.rawValue
            PickerView.pickerView.reloadAllComponents()
            if let lastIndex = PickerView.selectionForCongress[0].index(where: { $0 == lastSelected[0] }){
                PickerView.pickerView.selectRow(lastIndex, inComponent: 0, animated: false)
            }
            if let lastSecondIndex = PickerView.selectionForCongress[1].index(where: { $0 == lastSelected[1] }){
                PickerView.pickerView.selectRow(lastSecondIndex, inComponent: 1, animated: false)
            }
            PickerView.pickerView.reloadAllComponents()
            break
        case kindOfPickerView.disease.rawValue:
            PickerView.result = lastSelected
            PickerView.selected = kindOfPickerView.disease.rawValue
            if let lastIndex = PickerView.selectionForDisease.index(where: { $0 == lastSelected[0] }){
                PickerView.pickerView.selectRow(lastIndex, inComponent: 0, animated: false)
            }
            PickerView.pickerView.reloadAllComponents()
            break
        default:
            PickerView.result = lastSelected
            PickerView.selected = kindOfPickerView.stage.rawValue
            if let lastIndex = PickerView.selectionForStage.index(where: { $0 == lastSelected[0] }){
                PickerView.pickerView.selectRow(lastIndex, inComponent: 0, animated: false)
            }
            PickerView.pickerView.reloadAllComponents()
            break
        }
    }
}




enum kindOfPickerView: Int {
    case congress = 1
    case disease = 2
    case stage = 3
    
}


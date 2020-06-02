//
//  CameraView+UI.swift
//  POV
//
//  Created by Hendy Rusnanto on 14/05/20.
//  Copyright © 2020 HR. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    
//MARK: - INITIAL CONTENT
    
    // Initial style
    func InitialStyle() {
        gridInUsed.layer.opacity = 0                                                // Hide Grid
        gridPicker.delegate = self                                                  // Show the Picker View in the screen
        gridPicker.dataSource = self                                                // Not used
        gridPicker.selectRow(2, inComponent: 0, animated: true)                     // Initial Picker View Selected Item
        rotationAngle = -90 * (.pi/180)                                             // Declare Value for Rotating Picker View 90°
        let y = gridPicker.frame.origin.y                                           // Declare Picker View (Y) Position
        gridPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)      // Rotating Picker View 90°
        gridPicker.frame = CGRect(x: -400, y: y + 5, width: view.frame.width + 800, height: 20) // Picker View Position and Size
    }
    
    // Grid Color Reset all value to 0
    func gridColorReset() {
        RoTColorCode = 0
        GTColorCode = 0
        FSColorCode = 0
        DRColorCode = 0
        TPGColorCode = 0
    }
    
//MARK: - TURN GRID ON/OFF BY TAPPING GRID ACTION BUTTON
    
    
    // On (show Grid Button is Tapped)
    func ifGridButtonTapped() {
        // On Condition
        if gridCondition == 1 {
            gridMode = true
            gridInUsed.layer.opacity = 1
            gridCondition = 0
            ShowGridButton.setImage(UIImage(named: "grid"), for: .normal)
        }
        // Off Condition
        else {
            gridMode = false
            gridInUsed.layer.opacity = 0
            gridCondition = 1
            ShowGridButton.setImage(UIImage(named: "no grid"), for: .normal)
        }
    }
    
    
// MARK: - CHANGE GRID MODE BY PICKER VIEW
    
    // Declare Number of picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
      
    // Declare Number of Option
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gridType.count
    }
      
    // Select an Option (No need to use this anymore)
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gridType[row]
    }
    
    // Text Style (No need to use this anymore)
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {

        return NSAttributedString(string: gridType[row], attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
    }
      
    // Action for Grid Selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        gridInUsed.image = UIImage(named: gridType[row])
        GridCode = (gridType[row])
        SwipeCode = row
        gridPicker.reloadComponent(component)
    }
    
    // Spacing between Label
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 141
    }
    
    // View Style
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        let label = UILabel()
        label.frame = CGRect(x: -50, y: 0, width: 200, height: 100)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = gridType[row].uppercased()
        

        if row == SwipeCode {
            label.textColor = UIColor.yellow
            print("true ", " :     ", row, " | ", SwipeCode)
        }
        else {
            label.textColor = UIColor.white
            print("false", " :     ", row, " | ", SwipeCode)
        }
        
        print("-------------------------")
        
        
        view.addSubview(label)
        view.transform = CGAffineTransform(rotationAngle: 90 * (.pi/180))

        return view
    }
    
//MARK: - GRID MODEL FOR SWIPE ACTION

    // change grid mode by swipe
    func ifSwipedRight() {
        gridColorReset()
        if SwipeCode < 4 {
            SwipeCode += 1
            gridPicker.selectRow(SwipeCode, inComponent: 0, animated: true)
            gridInUsed.image = UIImage(named: gridType[SwipeCode])
            GridCode = (gridType[SwipeCode])
        }
        
        else if SwipeCode == 4 {
            SwipeCode = 0
            gridPicker.selectRow(SwipeCode, inComponent: 0, animated: true)
            gridInUsed.image = UIImage(named: gridType[SwipeCode])
            GridCode = (gridType[SwipeCode])
        }
    }
    
   // change grid mode by swipe
   func ifSwipedLeft() {
           gridColorReset()
           if SwipeCode > 0 {
               SwipeCode -= 1
               gridPicker.selectRow(SwipeCode, inComponent: 0, animated: true)
               gridInUsed.image = UIImage(named: gridType[SwipeCode])
               GridCode = (gridType[SwipeCode])
           }
           
           else if SwipeCode == 0 {
               SwipeCode = 4
               gridPicker.selectRow(SwipeCode, inComponent: 0, animated: true)
               gridInUsed.image = UIImage(named: gridType[SwipeCode])
               GridCode = (gridType[SwipeCode])
           }
       }

//MARK: - CHANGE GRID COLOR
    
    
    // func for changing grid color
    func gridColorButtonTapped() {
        while gridMode == true {
            if GridCode == "Rule of Third"{
                if  RoTColorCode >= 5 {
                    RoTColorCode = 0
                    gridInUsed.image = UIImage(named: "Rule of Third")
                    return
                }
                else {
                    RoTColorCode += 1
                    gridInUsed.image = UIImage(named: "RoT\(RoTColorCode)")
                    return
                }
            }
            else if GridCode == "Golden Triangle"{
               if  GTColorCode >= 5 {
                   GTColorCode = 0
                   gridInUsed.image = UIImage(named: "Golden Triangle")
                   return
               }
               else {
                   GTColorCode += 1
                   gridInUsed.image = UIImage(named: "Golden Triangle-\(GTColorCode)")
                   return
               }
            }
            else if GridCode == "Fibonacci Spiral"{
                if  FSColorCode >= 5 {
                    FSColorCode = 0
                    gridInUsed.image = UIImage(named: "Fibonacci Spiral")
                    return
                }
                else {
                    FSColorCode += 1
                    gridInUsed.image = UIImage(named: "Fibonacci Spiral-\(FSColorCode)")
                    return
                }
            }
            else if GridCode == "Diagonal Rule"{
                if  DRColorCode >= 5 {
                    DRColorCode = 0
                    gridInUsed.image = UIImage(named: "Diagonal Rule")
                    return
                }
                else {
                    DRColorCode += 1
                    gridInUsed.image = UIImage(named: "Diagonal Rule-\(DRColorCode)")
                    return
                }
            }
            else if GridCode == "The Phi Grid"{
                if  TPGColorCode >= 5 {
                    TPGColorCode = 0
                    gridInUsed.image = UIImage(named: "The Phi Grid")
                    return
                }
                else {
                    TPGColorCode += 1
                    gridInUsed.image = UIImage(named: "The Phi Grid-\(TPGColorCode)")
                    return
                }
            }
        }
    }
    
    //MARK: - Grid Info
    
    func gridInfoTouched() {
        
        if GridCode == "Rule of Third" && gridMode == true {
            self.performSegue(withIdentifier: "RoT", sender: self)
        }
        else if GridCode == "Golden Triangle" && gridMode == true {
            self.performSegue(withIdentifier: "GT", sender: self)
        }
        else if GridCode == "Fibonacci Spiral" && gridMode == true {
            self.performSegue(withIdentifier: "FS", sender: self)
        }
        else if GridCode == "Diagonal Rule" && gridMode == true {
            self.performSegue(withIdentifier: "DR", sender: self)
        }
        else if GridCode == "The Phi Grid" && gridMode == true {
            self.performSegue(withIdentifier: "TPG", sender: self)
        }
    }
}

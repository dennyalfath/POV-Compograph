//
//  FSDefinitionVC.swift
//  POV-CameraApp
//
//  Created by Denny Alfath on 27/05/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

class FSDefinitionVC: UIViewController {

    @IBOutlet weak var txtDef: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtDef.text = "Fibonacci Spiral also called as Golden Spiral is built from a series of squares that are based on the Fibonacci numbers. The length of every square is a Fibonacci number.  This is a pattern that appears everywhere in nature and resembles the shell of a nautilus. The curve flows through the frame and leads your eye around the picture."
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

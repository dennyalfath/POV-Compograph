//
//  PGHowVC.swift
//  POV-CameraApp
//
//  Created by Denny Alfath on 16/06/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

class PGHowVC: UIViewController {

    @IBOutlet weak var txtHow: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtHow.text = "Place the objects of interest near or at the intersections of any of the lines"
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

//
//  ROTHowVC.swift
//  POV-CameraApp
//
//  Created by Denny Alfath on 16/06/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

class ROTHowVC: UIViewController {

    @IBOutlet weak var txtHow: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtHow.text = NSLocalizedString("1. Think about what elements of the photo are most important, and try to position them at or near the lines and intersections of the grid. They don't have to be perfectly lined up as long as they're close. \n2. Move around to get the best composition", comment: "")
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

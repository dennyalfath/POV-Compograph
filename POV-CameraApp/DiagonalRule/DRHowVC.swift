//
//  DRHowVC.swift
//  POV-CameraApp
//
//  Created by Denny Alfath on 16/06/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

class DRHowVC: UIViewController {

    @IBOutlet weak var txtHow: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtHow.text = "1. Try to tilt your camera  2. Look for leading lines that can help you with diagonal rule  3. Capture your photo from the bottom or top corner of the frame"
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

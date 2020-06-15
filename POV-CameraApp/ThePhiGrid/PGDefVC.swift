//
//  PGDefVC.swift
//  POV-CameraApp
//
//  Created by Denny Alfath on 16/06/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

class PGDefVC: UIViewController {

    @IBOutlet weak var txtDef: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtDef.text = NSLocalizedString("What you can see when using the Phi Grid is in the spaces where gridlines intersect. These so-called “sweet spots” are places where the eye is naturally drawn in an image. Cropping or aligning an image so that key parts fall in these areas will create focus and harmony.", comment: "")
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

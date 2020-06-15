//
//  GTHowVC.swift
//  POV-CameraApp
//
//  Created by Denny Alfath on 26/05/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

class GTHowVC: UIViewController {

    @IBOutlet weak var txtHow: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtHow.text = NSLocalizedString("1. Filling one of the triangles with the  subject. \n2. Placing the diagonal elements so that they  run along two of the lines", comment: "")
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

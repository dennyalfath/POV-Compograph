//
//  DRDefVC.swift
//  POV-CameraApp
//
//  Created by Denny Alfath on 16/06/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

class DRDefVC: UIViewController {

    @IBOutlet weak var txtDef: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtDef.text = "In diagonal rule composition, the elements in the image are organised based on diagonal line. Such composition can emphasise perspective, give the image sense of depth, and also add dynamism."
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

//
//  GTDefinitionVC.swift
//  POV-CameraApp
//
//  Created by Denny Alfath on 26/05/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

class GTDefinitionVC: UIViewController {

    @IBOutlet weak var txtDef: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtDef.text = NSLocalizedString("The frame is divided into four triangles of two different sizes, done by drawing one diagonal from one corner to another, and then two lines from the other corners, touching the first at 90 degree angles.", comment: "")
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

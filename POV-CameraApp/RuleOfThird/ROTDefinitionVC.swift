//
//  ROTDefinitionVC.swift
//  POV-CameraApp
//
//  Created by Denny Alfath on 16/06/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

class ROTDefinitionVC: UIViewController {
    
    @IBOutlet weak var txtDef: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        txtDef.text = "The rule of thirds involves dividing up your image using 2 horizontal lines and 2 vertical lines, as shown below. You then position the important elements in your scene along those lines, or at the points where they meet.  The idea is that an off-centre composition is more pleasing to the eye and looks more natural than one where the subject is placed right in the middle of the frame. It also encourages you to make creative use of negative space, the empty areas around your subject."
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

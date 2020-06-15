//
//  FSHowVC.swift
//  POV-CameraApp
//
//  Created by Denny Alfath on 27/05/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

class FSHowVC: UIViewController {

    @IBOutlet weak var txtHow: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtHow.text = NSLocalizedString("1. Take a look at the image of the spiral again. Its base – the smallest quadrangle – should be the area of your frame with greatest detail. Ideally, the rest of the object should be placed within the spiral. \n\n2. Mind that the center of the spiral need not be in the lower right corner. It can be anywhere in the frame, depending on your object.\n\n3. Shoot your object in such a way that its curves follow the curves of an imaginary golden spiral. This way the eye of the viewer will go straight to the object of interest and follow its natural expansion within the frame.", comment: "")
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

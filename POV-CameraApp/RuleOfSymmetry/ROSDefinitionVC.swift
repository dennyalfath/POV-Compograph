//
//  ROSDefinitionVC.swift
//  POV-CameraApp
//
//  Created by Denny Alfath on 15/06/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

class ROSDefinitionVC: UIViewController {
    
    @IBOutlet weak var txtDef: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtDef.text = NSLocalizedString("Symmetry refers to a line that splits an object in half and, if both sides of the object are an exact mirror image of each other, then this object is said to be symmetrical. The line that splits a symmetrical object is called the line of symmetry. Symmetry is a powerful tool that lets you automatically create harmony and a sense of aesthetically pleasing balance and proportion in a photograph.\n\nThere are two types of symmetry:\n1. Vertical Line of Symmetry (VLS): If an object’s line of symmetry is perpendicular to the horizon line, it has a vertical line of symmetry. \n2. Horizontal Line of Symmetry (HLS): If an object’s line of symmetry is parallel to the horizon line, it has a horizontal line of symmetry.", comment: "")

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

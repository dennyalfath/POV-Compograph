//
//  ViewController.swift
//  POV-CameraApp
//
//  Created by Denny Alfath on 10/05/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var cameraButton: UIButton!                     // Capture Button           (Style)
    @IBOutlet weak var cameraView: UIImageView!                    // Camera Screen            (Style)
    @IBOutlet weak var gridInUsed: UIImageView!                    // Grid Screen              (Style)
    @IBOutlet weak var ShowGridButton: UIButton!                   // Grid on/off button       (Style)
    @IBOutlet weak var bottomView: UIView!                         // Bottom View              (Style)
    @IBOutlet weak var gridPicker: UIPickerView!                   // Grid Picker Controller   (Style)
    @IBOutlet weak var cameraButtonTappedIndicator: UIView!
    @IBOutlet weak var LastImageView: UIButton!
    @IBOutlet weak var showRecentPhotoBackground: UIView!
    @IBOutlet weak var RecentPhoto: UIImageView!
    @IBOutlet weak var CloseRecentPhoto: UIButton!
    
    
    
    //Variable for Camera Screen
    var captureSession = AVCaptureSession()
    var previewLayer = AVCaptureVideoPreviewLayer()
    var frontCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
    var backCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
    var capturePhotoOutput: AVCapturePhotoOutput?
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    //Variable for Grid
    var gridCondition: Int = 1                                                // Represent Grid On or Off
    var gridMode: Bool = false                                                // If Grid Condition on means edit the grid is true
    let gridType = [String](arrayLiteral: "The Phi Grid", "Fibonacci Spiral", "Rule of Third", "Golden Triangle", "Diagonal Rule", "Rule of Symmetry")                                            // Grids Style Data
    var GridCode = "Rule of Third"                                            // Tracking what grid is in use right now (String)
    var RoTColorCode = 0                                                      // Rule of Third Color numbers
    var GTColorCode = 0                                                       // Golden Triangle Color numbers
    var FSColorCode = 0                                                       // Fibonacci Spiral Color numbers
    var DRColorCode = 0                                                       // Diagonal Rule Color numbers
    var TPGColorCode = 0                                                      // The Phi Grid Color numbers
    var RoSColorCode = 0                                                      // Rule of Symmetry Color numbers
    var SwipeCode = 2                                                         // Tracking what grid is in use right now (Int)
    var rotationAngle: CGFloat!                                               // Value for rotating Picker View
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Camera Screen
        
        if #available(iOS 13.4, *) {
            let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            do
            {
                let input = try AVCaptureDeviceInput(device: captureDevice!)
                captureSession = AVCaptureSession()
                captureSession.addInput(input)
                captureSession.sessionPreset = .hd1920x1080
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer.frame = view.bounds
                previewLayer.videoGravity = .resizeAspect
                cameraView.layer.addSublayer(previewLayer)
                captureSession.startRunning()
            }
            catch
                {
                    print("error")
                }
        }
        
        capturePhotoOutput = AVCapturePhotoOutput()
        capturePhotoOutput?.isHighResolutionCaptureEnabled = true
        captureSession.addOutput(capturePhotoOutput!)

        //Func for GridView
        InitialStyle()
    }
    

    //MARK: - Grid Action
    
    // Tap Grid logo on the upper left to turn grid on / off    (Action)
    @IBAction func ShowGridButton(_ sender: Any) {
        ifGridButtonTapped()
    }

    // swipe Right to Left = change next Grid Models   (Action)
    @IBAction func SwipeGridModeChange(_ sender: Any) {
        ifSwipedRight()
    }
    
     // swipe Right to change next Grid Models   (Action)
    @IBAction func UndoSwipeGridModeChange(_ sender: Any) {
        ifSwipedLeft()
    }
    
    // Tap any screen to change grid color   (Action)
    @IBAction func GridColorButtonChange(_ sender: Any) {
        gridColorButtonTapped()
    }
    
    @IBAction func gridInfo(_ sender: Any) {
        gridInfoTouched()
    }
    
    //MARK: - Camera Screen Action
    @IBAction func imageCapture(_ sender: Any)
    {
        guard let capturePhotoOutput = self.capturePhotoOutput else { return }
        
        let photoSettings = AVCapturePhotoSettings()
        photoSettings.isAutoStillImageStabilizationEnabled = true
        photoSettings.isHighResolutionPhotoEnabled = true
        
        capturePhotoOutput.capturePhoto(with: photoSettings, delegate: self)
    }
    
    func switchToFrontCamera() {
        if frontCamera?.isConnected == true {
            captureSession.stopRunning()
            let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
            do {
                let input = try AVCaptureDeviceInput(device: captureDevice!)
                captureSession = AVCaptureSession()
                captureSession.addInput(input)
                captureSession.sessionPreset = .hd1920x1080
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer.frame = view.bounds
                previewLayer.videoGravity = .resizeAspect
                cameraView.layer.addSublayer(previewLayer)
                captureSession.startRunning()
                capturePhotoOutput = AVCapturePhotoOutput()
                capturePhotoOutput?.isHighResolutionCaptureEnabled = true
                captureSession.addOutput(capturePhotoOutput!)
            } catch {
                print("error")
            }
        }
    }
    
    func switchToBackCamera() {
        if backCamera?.isConnected == true {
            captureSession.stopRunning()
            let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            do {
                let input = try AVCaptureDeviceInput(device: captureDevice!)
                captureSession = AVCaptureSession()
                captureSession.addInput(input)
                captureSession.sessionPreset = .hd1920x1080
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer.frame = view.bounds
                previewLayer.videoGravity = .resizeAspect
                cameraView.layer.addSublayer(previewLayer)
                captureSession.startRunning()
                capturePhotoOutput = AVCapturePhotoOutput()
                capturePhotoOutput?.isHighResolutionCaptureEnabled = true
                captureSession.addOutput(capturePhotoOutput!)
            } catch {
                print("error")
            }
        }
    }
    
    @IBAction func rotateCamera(_ sender: Any) {
        guard let currentCameraInput: AVCaptureInput = captureSession.inputs.first else {
            return
        }
        
        if let input = currentCameraInput as? AVCaptureDeviceInput {
            if input.device.position == .back {
                switchToFrontCamera()
            }
            if input.device.position == .front {
                switchToBackCamera()
            }
        }
    }
    
    
    
    @IBAction func showRecentImageButtonTapped(_ sender: Any) {
        
        showRecentPhotoBackground.layer.opacity = 1
        RecentPhoto.layer.opacity = 1
        CloseRecentPhoto.layer.opacity = 1
        
    }
    
    
    @IBAction func RecentPhotoBackButtonTapped(_ sender: Any) {
        
        showRecentPhotoBackground.layer.opacity = 0
        RecentPhoto.layer.opacity = 0
        CloseRecentPhoto.layer.opacity = 0
        
    }
    
}





extension ViewController : AVCapturePhotoCaptureDelegate
{
    
func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?,
                 previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings,
                 bracketSettings backetSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
                        guard error == nil,
                            let photoSampleBuffer = photoSampleBuffer else {
                                print("Error")
                                return
                            }
                        guard let imageData = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: photoSampleBuffer, previewPhotoSampleBuffer: previewPhotoSampleBuffer) else {
                                    return
                            }
                        let capturedImage = UIImage.init(data: imageData, scale: 1.0)
                        if let image = capturedImage {
                            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                        }
    
    print(imageData)
    
                        ifCameraButtonTapped()
    
    
                        var images: UIImage = UIImage(data: imageData)!
    
                        var imagex: UIImage = images as UIImage
                        LastImageView.setImage(imagex, for: .normal)
    
                        RecentPhoto.image = UIImage(data: imageData)!
    
    }

}


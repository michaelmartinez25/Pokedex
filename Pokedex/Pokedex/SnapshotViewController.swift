//
//  SnapshotViewController.swift
//  Pokedex
//
//  Created by Michael Martinez on 4/15/24.
//

import UIKit

class SnapshotViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var photoCaptureButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func didTapButton(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true

        // The Xcode simulator does not support taking pictures, so let's first check that the camera is indeed supported on the device before trying to present it.
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
           print("Camera is available 📸")
           vc.sourceType = .camera
        } else {
           print("Camera 🚫 available so we will use photo library instead")
           vc.sourceType = .photoLibrary
        }

        self.present(vc, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let originalImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        let editedImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        
        // TODO: Do something with the images (based on your use case)
        
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
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

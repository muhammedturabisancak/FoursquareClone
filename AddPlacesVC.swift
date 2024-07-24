//
//  AddPlacesVC.swift
//  FoursquareClone
//
//  Created by Muhammed Turabi Sancak on 24.07.2024.
//

import UIKit

class AddPlacesVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  @IBOutlet weak var placeNameText: UITextField!
  @IBOutlet weak var placeTypeText: UITextField!
  @IBOutlet weak var placeAtmosphereText: UITextField!
  @IBOutlet weak var placesImageView: UIImageView!
  
  
  
  override func viewDidLoad() {
        super.viewDidLoad()

    placesImageView.isUserInteractionEnabled = true
    let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
    placesImageView.addGestureRecognizer(gestureRecognizer)
    }
    

 
  @objc func chooseImage(){
    let pickerController = UIImagePickerController()
    pickerController.delegate = self
    pickerController.sourceType = .photoLibrary
    present(pickerController, animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    placesImageView.image = info[.originalImage] as? UIImage
    self.dismiss(animated: true, completion: nil)
  }
  
  
  
  
  
  
  
  @IBAction func nextButtonClicked(_ sender: Any) {
    performSegue(withIdentifier: "toMapVC", sender: nil)
  }
  
}

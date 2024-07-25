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
    
    let placeModel = PlaceModel.sharedInstance
    
    if placeNameText.text != "" && placeTypeText.text != "" && placeAtmosphereText.text != "" {
      if let choosenImage = placesImageView.image{
        let placeModel = PlaceModel.sharedInstance
        placeModel.placeName = placeNameText.text!
        placeModel.placeType = placeTypeText.text!
        placeModel.placeAtmosphere = placeAtmosphereText.text!
        placeModel.placeImage = choosenImage
      }
    }else{
      let alert = UIAlertController(title: "Error", message: "Place Name/Type/Atmosphere", preferredStyle: UIAlertController.Style.alert)
      let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
      alert.addAction(okButton)
      present(alert, animated: true, completion: nil)
    }
    
    
    
    placeModel.placeName = placeNameText.text!
  
    
    
    
    performSegue(withIdentifier: "toMapVC", sender: nil)
  }
  
}

//
//  UploadViewController.swift
//  InstaCloneFirebase
//
//  Created by Mac on 8.01.2022.
//

import UIKit
import Firebase

class UploadViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var uploadingImageView: UIImageView!
    @IBOutlet weak var txtComment: UITextField!
    @IBOutlet weak var btnUpload: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadingImageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        // Do any additional setup after loading the view.
        uploadingImageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func chooseImage() {
        //reaching user fotos lib;
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
        
    }
    //picker method;
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        uploadingImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func uploadButtonPressed(_ sender: UIButton) {
        let storage = Storage.storage()
        let storageReference = storage.reference()
        let mediaFolder = storageReference.child("media")
        if let data = uploadingImageView.image?.jpegData(compressionQuality: 0.5){
            let uuid = UUID().uuidString
            let imageReferance = mediaFolder.child("\(uuid).jpg")
            imageReferance.putData(data, metadata: nil) { (metaData, error) in
                if error != nil {
                    self.callAlert(title: "error", message:error?.localizedDescription ?? " ")
                }else {
                    //save image to storage;
                    imageReferance.downloadURL { (url, error2) in
                        if error != nil {
                            self.callAlert(title: "error", message:error2?.localizedDescription ?? " ")
                        }else {
                            let imageUrl = url?.absoluteString
                           // print(imageUrl!)
                            //database;
                            
                        }
                    }
                }
            }
        }
        
    }
    func callAlert(title:String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let button = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(button)
        self.present(alert, animated: true, completion: nil)
    }

}

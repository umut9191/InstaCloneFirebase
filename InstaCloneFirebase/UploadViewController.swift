//
//  UploadViewController.swift
//  InstaCloneFirebase
//
//  Created by Mac on 8.01.2022.
//

import UIKit

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
    }
    

}

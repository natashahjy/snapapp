//
//  ViewController.swift
//  SnapApp
//
//  Created by ITP312 on 30/5/17.
//  Copyright © 2017 ITP312. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate{

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet weak var takePicture: UIButton!
    
    @IBOutlet weak var selectPicture: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if !(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera))
        {
            takePicture.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func takePicture(sender: AnyObject){
        let picker = UIImagePickerController()
        picker.delegate = self
        
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerControllerSourceType.camera
        
        self.present(picker, animated: true)
    }
    
    @IBAction func selectPicture(sender: AnyObject){
        let picker = UIImagePickerController()
        picker.delegate = self
        
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage : UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        self.imageView!.image = chosenImage
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}


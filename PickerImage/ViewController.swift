//
//  ViewController.swift
//  PickerImage
//
//  Created by Nando Septian Husni on 5/24/18.
//  Copyright © 2018 imastudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var imView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnView(_ sender: UIButton) {
     // this will be used for viewing image from the gallery or take the image to camera
        
        let picker = UIImagePickerController()
        picker.delegate = self
        
        
        //this will show  the alert dialogue
        let alert = UIAlertController(title: "Choose", message: "Choose your image", preferredStyle: .alert)
        let gallery = UIAlertAction(title: "Gallery", style: .default) { (action) in
            
            //choosing your image from the gallery
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
            
        }
        let camera = UIAlertAction(title: "CAMERA", style: UIAlertActionStyle.default) { (act2) in
            if UIImagePickerController.isSourceTypeAvailable(.camera)
            {
                picker.sourceType = .camera
                self.present(picker,animated: true, completion: nil)
                
            }else{
                print("camera is not avialable")
            }
            
            // is the camera avialable or not
        }
        
        //to give the action to your button
        alert.addAction(gallery)
        alert.addAction(camera)
        present(alert, animated: true, completion: nil)
    }
    //function to picture image
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
       // get imsge that you choose imageView to the image that u just choose
        
        let  myImage = info[UIImagePickerControllerOriginalImage]
        
        //setting image to imageview
        imView.image = (myImage as! UIImage)
        
        // dismissing our alert dialgoue
        
        picker.dismiss(animated: true, completion: nil)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


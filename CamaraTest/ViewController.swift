//
//  ViewController.swift
//  CamaraTest
//
//  Created by KurtHo on 2016/8/5.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let picker = UIImagePickerController()

    static let profileImage = "PROFILE_IMAGE"

    
    
    
    @IBOutlet weak var myImage: UIImageView!
    @IBAction func camaraButton(sender: AnyObject) {
        picker.sourceType = .Camera
        picker.delegate = self
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func pickAImage(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        imagePicker.allowsEditing = false
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myImage.image = UIImage(named: "heart")
        getUserPreferences()
    }
    override func viewWillAppear(animated: Bool) {
        myImage.reloadInputViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info["UIImagePickerControllerOriginalImage"] as! UIImage
        self.myImage.image = image

        UIImageWriteToSavedPhotosAlbum(self.myImage.image!, nil, nil, nil)
//
        self.dismissViewControllerAnimated(true, completion: nil)
        saveSelectedImage(image)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.dismissViewControllerAnimated(true, completion: nil)
        saveSelectedImage(image)
    }
    
    
//    func imagePicwkerController(picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : AnyObject]) {
//        
//        let image = info["UIImagePickerControllerOriginalImage"] as! UIImage
//        self.myImage.image = image
//        UIImageWriteToSavedPhotosAlbum(self.myImage.image!, nil, nil, nil)
//        let paths =
//            NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
//        let documentsDirectory = paths.first
//        let interval = NSDate.timeIntervalSinceReferenceDate()
//        let name = "\(interval).jpg"
//        let path = (documentsDirectory as
//            NSString?)?.stringByAppendingPathComponent(name)
//        let data = UIImageJPEGRepresentation(image, 0.9)
//        data?.writeToFile(path!, atomically: true)
//        self.dismissViewControllerAnimated(true, completion: nil)
//        saveSelectedImage(image)
//    }
    
    
    
    
    func saveSelectedImage(image : UIImage) {
        myImage.image = image
        
        // Save image to NSUserDefaults
        let prefs = NSUserDefaults.standardUserDefaults()
        let imageData = UIImageJPEGRepresentation(image, 100)
        prefs.setObject(imageData, forKey: ViewController.profileImage)
            print("save photo~~~~")
    }
    
    func getUserPreferences() {
        let prefs = NSUserDefaults.standardUserDefaults()
        if let imageData = prefs.objectForKey(ViewController.profileImage) as? NSData {
            let storedImage = UIImage.init(data: imageData)
            myImage.image = storedImage
        }
    }
}


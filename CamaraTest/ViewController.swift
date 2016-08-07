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
    
    
    
    
    @IBOutlet weak var myImage: UIImageView!
    @IBAction func camaraButton(sender: AnyObject) {
        picker.sourceType = .Camera
        picker.delegate = self
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func pickAImage(sender: AnyObject) {

        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myImage.image = UIImage(named: "heart")
    }
    override func viewWillAppear(animated: Bool) {
        myImage.reloadInputViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info["UIImagePickerControllerOriginalImage"]
        self.myImage.image = image as? UIImage

        UIImageWriteToSavedPhotosAlbum(self.myImage.image!, nil, nil, nil)
//
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
//    func imagePicwkerController(picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : AnyObject]) {
//        
//        let image = info["UIImagePickerControllerOriginalImage"] as! UIImage
//        self.myImage.image = image
//        UIImageWriteToSavedPhotosAlbum(self.myImage.image!, nil, nil, nil)
//
//        let paths =
//            
//            NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
//        let documentsDirectory = paths.first
//        let interval = NSDate.timeIntervalSinceReferenceDate()
//        let name = "\(interval).jpg"
//        let path = (documentsDirectory as
//            NSString?)?.stringByAppendingPathComponent(name)
//        let data = UIImageJPEGRepresentation(image, 0.9)
//        data?.writeToFile(path!, atomically: true)
//        self.dismissViewControllerAnimated(true, completion: nil)
//
//    }
    
    
    
    
    
    
    

}


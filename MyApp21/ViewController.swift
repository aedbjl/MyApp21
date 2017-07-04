//
//  ViewController.swift
//  MyApp21
//
//  Created by iii-user on 2017/7/4.
//  Copyright © 2017年 iii-user. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func camera(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let imgPC = UIImagePickerController()
            imgPC.sourceType = .camera
            imgPC.delegate = self
            
            show(imgPC, sender: self)
        }else {
            print("XX")
        }
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let img = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = img
        
        
        dismiss(animated :true, completion:{() in
            print("OK")
        })
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated :true, completion:{() in
            print("Cancel")
        })
    }
        
    @IBAction func test1(_ sender: Any) {
        
        let videoURL = URL(string:"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")

        let player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        view.layer.addSublayer(playerLayer)
        player.play()
        
    }
    
    @IBAction func test2(_ sender: Any) {
        
        let videoURL = URL(string:"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        
        let player = AVPlayer(url: videoURL!)
        let playerVC = AVPlayerViewController()
        playerVC.player = player
        
        self.present(playerVC, animated: true)

        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    

}



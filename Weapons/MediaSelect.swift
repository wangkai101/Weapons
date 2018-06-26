//
//  MediaSelect.swift
//  Weapons
//
//  Created by Mr wngkai on 2018/6/26.
//  Copyright © 2018年 Mr wngkai. All rights reserved.

import UIKit
import MobileCoreServices
import AVFoundation

extension NewWeaponController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        
        if mediaType == (kUTTypeMovie as String) {
            videoUrl = info[UIImagePickerControllerMediaURL] as! URL
            
            let asset = AVAsset(url: videoUrl)
            
            let gen = AVAssetImageGenerator(asset: asset)
            let time = CMTime(seconds: 0, preferredTimescale: 2)
            let image = try! gen.copyCGImage(at: time, actualTime: nil)
            bgimage.image = UIImage(cgImage: image)
            
            playBtn.isHidden = false
            
            
        } else {
            bgimage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

extension NewWeaponController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if indexPath.section == 0 {
            //print(indexPath)
            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
           
            
            let phonoAction = UIAlertAction(title: "Photo", style: .default) { (_) in
                guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
                    print("相册授权不成功！")
                    return
                }
                let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                picker.delegate = self
                self.present(picker, animated: true, completion: nil)
                
            }
            
            let takephonoAction = UIAlertAction(title: "Take a Photo", style: .default) { (_) in
                guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
                    return
                }
                let picker = UIImagePickerController()
                picker.sourceType = .camera
                picker.delegate = self
                self.present(picker, animated: true, completion: nil)
                
            }
            
            let videoAction = UIAlertAction(title: "Video", style: .default) { (_) in
                guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
                    
                    return
                }
                let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                picker.mediaTypes = [kUTTypeMovie as String]
                picker.delegate = self
                self.present(picker, animated: true, completion: nil)
            }
            
            let recordAction = UIAlertAction(title: "Record a Video", style: .default) { (_) in
                guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
                    return
                }
                let picker = UIImagePickerController()
                picker.sourceType = .camera
                picker.mediaTypes = [kUTTypeMovie as String]
                picker.videoQuality = .typeHigh
                picker.videoMaximumDuration = 10
                picker.delegate = self
                self.present(picker, animated: true, completion: nil)
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (_) in
                
            }
            
            actionSheet.addAction(phonoAction)
            actionSheet.addAction(takephonoAction)
            actionSheet.addAction(videoAction)
            actionSheet.addAction(recordAction)
            actionSheet.addAction(cancelAction)
            
            present(actionSheet, animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

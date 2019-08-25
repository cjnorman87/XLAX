//
//  VideoViewController.swift
//  Gazorpian
//
//  Created by Christopher Norman on 9/19/17.
//  Copyright © 2017 yakuza. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import Firebase
import SwiftyCam
import FirebaseStorage

class VideoViewController: UIViewController, UITextFieldDelegate {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private var videoURL: URL
    var player: AVPlayer?
    var playerController : AVPlayerViewController?
    
    init(videoURL: URL) {
        self.videoURL = videoURL
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    let typeField: UITextView = {
//        let TV = UITextView()
//        TV.keyboardAppearance = .dark
//        TV.tintColor = UIColor.red
//        TV.backgroundColor = UIColor.white
//        TV.textColor = .white
//        TV.font = .systemFont(ofSize: 32)
//        return TV
//    }()
//
//    let benefitField: UITextView = {
//        let TV = UITextView()
//        TV.keyboardAppearance = .dark
//        TV.tintColor = UIColor.red
//        TV.backgroundColor = UIColor.white
//        TV.textColor = .white
//        TV.font = .systemFont(ofSize: 32)
//        return TV
//    }()
//
//    let salaryField: UITextView = {
//        let TV = UITextView()
//        TV.keyboardAppearance = .dark
//        TV.tintColor = UIColor.red
//        TV.backgroundColor = UIColor.white
//        TV.textColor = .white
//        TV.font = .systemFont(ofSize: 32)
//        return TV
//    }()
//
//    let jobDeField: UITextView = {
//       let TV = UITextView()
//       TV.keyboardAppearance = .dark
//       TV.tintColor = UIColor.red
//       TV.backgroundColor = UIColor.white
//       TV.textColor = .white
//       TV.font = .systemFont(ofSize: 32)
//       return TV
//    }()
//
//    let jobTitle: UITextView = {
//        let TV = UITextView()
//        TV.keyboardAppearance = .dark
//        TV.tintColor = UIColor.red
//        TV.backgroundColor = UIColor.white
//        TV.textColor = .white
//        TV.font = .systemFont(ofSize: 32)
//        return TV
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        player = AVPlayer(url: videoURL)
        playerController = AVPlayerViewController()
        
        guard player != nil && playerController != nil else {
            return
        }
        playerController!.showsPlaybackControls = false
        
        playerController!.player = player!
        self.addChild(playerController!)
        self.view.addSubview(playerController!.view)    
        playerController!.view.frame = view.frame.standardized
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player!.currentItem)
        
        
//        let editTextBtn = UIButton(frame: CGRect(x: 250.0, y: 30.0, width: 30.0, height: 30.0))
//        editTextBtn.setImage(#imageLiteral(resourceName: "Edit"), for: UIControl.State())
//        editTextBtn.addTarget(self, action: #selector(showTextField), for: .touchUpInside)
//        view.addSubview(editTextBtn)
        
        let sendButton = UIButton(frame: CGRect(x: 300.0, y: 30.0, width: 30.0, height: 30.0))
        sendButton.setImage(#imageLiteral(resourceName: "send_snap"), for: UIControl.State())
        sendButton.addTarget(self, action: #selector(post), for: .touchUpInside)
        view.addSubview(sendButton)
        
        let cancelButton = UIButton(frame: CGRect(x: 10.0, y: 30.0, width: 30.0, height: 30.0))
        cancelButton.setImage(#imageLiteral(resourceName: "cancels"), for: UIControl.State())
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        view.addSubview(cancelButton)
        
    }
    
    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func post() {
        let newVC = StoriesViewController(videoURL: videoURL)
        self.present(newVC, animated: true, completion: nil)
    }
    
<<<<<<< HEAD:XLAX/Recruiter/Camera/VideoViewController.swift
    @objc func showTextField() {
        view.addSubview(jobDeField)
        jobDeField.anchor(top: view.centerYAnchor, bottom: nil, right: view.centerXAnchor, left: nil, paddingTop: 0, paddingBottom: 0, paddingRight: 0, paddingLeft: 20, height: 50, width: 200)
        view.addSubview(salaryField)
        salaryField.anchor(top: view.topAnchor, bottom: nil, right: nil, left: nil, paddingTop: 100, paddingBottom: 0, paddingRight: 0, paddingLeft: 20, height: 200, width: 50)
        view.addSubview(benefitField)
        benefitField.anchor(top: salaryField.bottomAnchor, bottom: nil, right: nil, left: nil, paddingTop: 0, paddingBottom: 0, paddingRight: 0, paddingLeft: 0, height: 50, width: 200)
        view.addSubview(typeField)
        typeField.anchor(top: benefitField.bottomAnchor, bottom: nil, right: nil, left: nil, paddingTop: 0, paddingBottom: 0, paddingRight: 0, paddingLeft: 0, height: 50, width: 200)
        view.addSubview(jobTitle)
        jobTitle.anchor(top: typeField.bottomAnchor, bottom: nil, right: nil, left: nil, paddingTop: 0, paddingBottom: 0, paddingRight: 0, paddingLeft: 0, height: 50, width: 200)
        
    }
=======
//    fileprivate func saveToDataBaseWithImageURL(urlString: String) {
//        guard let jobDescrip = jobDeField.text else { return }
//        guard let salaryAmt = salaryField.text else { return }
//        guard let benefit = benefitField.text else { return }
//        guard let typeDescrip = typeField.text else { return }
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//        let userPostRef = Database.database().reference().child("posts").child(uid)
//        let ref = userPostRef.childByAutoId()
//        let values = ["videoURL": urlString, "Job Description": jobDescrip,"Salary": salaryAmt,"Benefits": benefit,"Type": typeDescrip, "CreationDate": Date().timeIntervalSince1970] as [String : Any]
//        let newVC = StoriesViewController(values: values)
//        self.present(newVC, animated: true, completion: nil)
//        ref.updateChildValues(values) { (err, ref) in
//            if let err = err {
//                print("Failed to save post to DB:", err)
//                return
//            }
//            print("Successfully saved post to DB")
//            self.dismiss(animated: true, completion: nil)
//        }
//    }
    
//    @objc func showTextField() {
//        view.addSubview(jobDeField)
//        jobDeField.anchor(top: view.centerYAnchor, left: nil, bottom: nil, right: view.centerXAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 200, height: 50)
//        view.addSubview(salaryField)
//        salaryField.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 200, height: 50)
//        view.addSubview(benefitField)
//        benefitField.anchor(top: salaryField.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 50)
//        view.addSubview(typeField)
//        typeField.anchor(top: benefitField.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 50)
//        view.addSubview(jobTitle)
//        jobTitle.anchor(top: typeField.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 50)
//    }
>>>>>>> origin:XLAX/Camera/VideoViewController.swift
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        player?.play()
    }
    
    @objc fileprivate func playerItemDidReachEnd(_ notification: Notification) {
        if self.player != nil {
            self.player!.seek(to: CMTime.zero)
            self.player!.play()
        }
    }
}


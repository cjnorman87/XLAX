//
//  SignUpController.swift
//  XLAX
//
//  Created by Christopher Norman on 7/10/19.
//  Copyright © 2019 Christopher Norman. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    var isSwitchOn: Bool = false
    
    let signUpLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Sign Up"
        lb.font = UIFont.systemFont(ofSize: 36)
        lb.textColor = UIColor.rgb(red: 169, green: 169, blue: 248)
        return lb
    }()
    
    let emailTextField: UITextField = {
        let Tf = UITextField()
        Tf.placeholder = "email"
        Tf.backgroundColor = UIColor(white:0, alpha: 0.03)
        Tf.borderStyle = .roundedRect
        Tf.font = UIFont.systemFont(ofSize: 14)
        Tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        Tf.returnKeyType = .continue
        return Tf
    }()
    
    let usernameTextField: UITextField = {
        let Tf = UITextField()
        Tf.placeholder = "Name"
        Tf.backgroundColor = UIColor(white:0, alpha: 0.03)
        Tf.borderStyle = .roundedRect
        Tf.font = UIFont.systemFont(ofSize: 14)
        Tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return Tf
    }()
    
    let passwordTextField: UITextField = {
        let Tf = UITextField()
        Tf.placeholder = "password"
        Tf.isSecureTextEntry = true
        Tf.backgroundColor = UIColor(white:0, alpha: 0.03)
        Tf.borderStyle = .roundedRect
        Tf.font = UIFont.systemFont(ofSize: 14)
        Tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        Tf.returnKeyType = .done
        return Tf
    }()
    
    let PhoneTextField: UITextField = {
        let Tf = UITextField()
        Tf.placeholder = "Phone"
        Tf.backgroundColor = UIColor(white:0, alpha: 0.03)
        Tf.borderStyle = .roundedRect
        Tf.font = UIFont.systemFont(ofSize: 14)
        Tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return Tf
    }()
    
    let companyTextField: UITextField = {
        let Tf = UITextField()
        Tf.placeholder = "Company Name"
        Tf.backgroundColor = UIColor(white:0, alpha: 0.03)
        Tf.borderStyle = .roundedRect
        Tf.font = UIFont.systemFont(ofSize: 14)
        Tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return Tf
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 169, green: 169, blue: 248)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    let profileSwitch: UISwitch = {
        let sw = UISwitch()
        sw.addTarget(self, action: #selector(handleSwitch), for: .valueChanged)
        return sw
    }()
    
    let chooseState = UILabel(text: "", font: UIFont.systemFont(ofSize: 14))
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Cancel").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleAlreadyHaveAccount), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        setupCancelButton()
        setupSignUpLabel()
        setupInputFields(isItOn: false)
    }
    
    @objc func handleSignUp() {
        guard let email = emailTextField.text, email.count > 0 else {return}
        guard let username = usernameTextField.text, username.count > 0 else {return}
        guard let pass = passwordTextField.text, pass.count > 0 else {return}
        guard let phone = PhoneTextField.text, pass.count > 0 else {return}
        guard let co = companyTextField.text, pass.count > 0 else {return}
        let isRec = String(profileSwitch.isOn)
        Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
            if let err = error{
                print("Cj: this is the errer", err)
                return
            }
            guard let uid = user?.user.uid else { return }
            let db = Firestore.firestore()
            let settings = db.settings
            settings.areTimestampsInSnapshotsEnabled = true
            db.settings = settings
            var ref: DocumentReference? = nil
            let dictionaryValues = ["username" : username,"phone" : phone,"company" : co,"recruiter" : isRec]
            let values = [uid: dictionaryValues]
            if isRec == "true"{
                ref = db.collection("users").addDocument(data: values) {
                    err in
                    if let err = err {
                        print("Error adding doc: \(err)")
                    } else {
                        print("Doc added w/ ID: \(ref!.documentID)")
                    }
                }
                Database.database().reference().child("susers").updateChildValues(values, withCompletionBlock: { (err, ref) in
                    
                    if let err = error {
                        print("Failed to save user info into db:", err)
                        return
                    }
                    print("Successfully saved user info to DB")
                    guard let mainTabBarController = UIApplication.shared.keyWindow?.rootViewController as? MainTabBarViewController else { return }
                    mainTabBarController.setupTabBar()
                    self.dismiss(animated: true, completion: nil)
                })
            } else {
                ref = db.collection("users").addDocument(data: values) {
                    err in
                    if let err = err {
                        print("Error adding doc: \(err)")
                    } else {
                        print("Doc added w/ ID: \(ref!.documentID)")
                    }
                }
                Database.database().reference().child("rusers").updateChildValues(values, withCompletionBlock: { (err, ref) in
                    
                    if let err = error {
                        print("Failed to save user info into db:", err)
                        return
                    }
                    print("Successfully saved user info to DB")
                    guard let mainTabBarController = UIApplication.shared.keyWindow?.rootViewController as? MainTabBarViewController else { return }
                    mainTabBarController.setupRecTabBar()
                    self.dismiss(animated: true, completion: nil)
                })
            }
        }
    }
    
    @objc func handleTextInputChange(){
        let isFormValid = emailTextField.text?.count ?? 0 > 0 && usernameTextField.text?.count ?? 0 > 0 && passwordTextField.text?.count ?? 0 > 0
        if isFormValid{
            signUpButton.isEnabled = true
            signUpButton.backgroundColor = UIColor.rgb(red: 17, green: 154, blue: 237)
        }else {
            signUpButton.isEnabled = false
            signUpButton.backgroundColor =  UIColor.rgb(red: 169, green: 169, blue: 248)
        }
    }
    
    @objc func handleAlreadyHaveAccount() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @objc func handleSwitch(_ sender: UISwitch!) {
        if sender.isOn {
            profileSwitch.setOn(true, animated: true)
            isSwitchOn = true
            setupInputFields(isItOn: isSwitchOn)
        } else {
            profileSwitch.setOn(false, animated: true)
            isSwitchOn = false
            setupInputFields(isItOn: isSwitchOn)
        }
    }
    
    fileprivate func setupInputFields(isItOn: Bool) {
        if isItOn {
            showFields()
        } else {
            hideFields()
        }
    }
    
    fileprivate func showFields() {
        if(profileSwitch.isOn) {
            chooseState.text = "Sign up as recruiter!"
            chooseState.textColor = UIColor.rgb(red: 136, green: 206, blue: 235)
        }
        setupRecruiterSignUpStackView()
    }
    
    fileprivate func hideFields() {
        if(profileSwitch.isOn == false) {
            chooseState.text = "Sign up as a searcher!"
            chooseState.textColor = UIColor.rgb(red: 136, green: 206, blue: 235)
        }
        setupSearcherSignUpStackView()
    
    }
    
    fileprivate func setupCancelButton() {
        view.addSubview(cancelButton)
        cancelButton.anchor(top: view.topAnchor, bottom: nil, right: nil, left: view.leftAnchor, paddingTop: 45, paddingBottom: 0, paddingRight: 0, paddingLeft: 25, height: 0, width: 50)
    }
    
    fileprivate func setupSignUpLabel() {
        view.addSubview(signUpLabel)
        signUpLabel.anchor(top: view.topAnchor, bottom: nil, right: nil, left: nil, paddingTop: 40, paddingBottom: 0, paddingRight: 0, paddingLeft: 0, height: 140, width: 140)
        signUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    fileprivate func setupController() {
         view.backgroundColor = .white
        passwordTextField.delegate = self
        emailTextField.delegate = self
    }
    
    fileprivate func setupRecruiterSignUpStackView() {
        let stackView = UIStackView(arrangedSubviews: [usernameTextField,emailTextField,PhoneTextField,passwordTextField,companyTextField,HorizontalStackView(arrangedSubviews: [chooseState,profileSwitch], spacing: 20),signUpButton])
        PhoneTextField.isHidden = true
        companyTextField.isHidden = true
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 40
        view.addSubview(stackView)
        stackView.anchor(top: signUpLabel.bottomAnchor, bottom: nil, right: view.rightAnchor, left: view.leftAnchor, paddingTop: 50, paddingBottom: 0, paddingRight: 40, paddingLeft: 40, height: 400, width: 0)
    }
    
    fileprivate func setupSearcherSignUpStackView() {
        let stackView = UIStackView(arrangedSubviews: [usernameTextField,emailTextField,PhoneTextField,passwordTextField,companyTextField,HorizontalStackView(arrangedSubviews: [chooseState,profileSwitch], spacing: 20),signUpButton])
        PhoneTextField.isHidden = false
        companyTextField.isHidden = false
        profileSwitch.anchor(top: nil, leading: nil, bottom: nil, trailing: stackView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15))
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 40
        view.addSubview(stackView)
        stackView.anchor(top: signUpLabel.bottomAnchor, bottom: nil, right: view.rightAnchor, left: view.leftAnchor, paddingTop: 20, paddingBottom: 0, paddingRight: 40, paddingLeft: 40, height: 550, width: 0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
        }
        if textField == passwordTextField {
            print("text field should return is being called")
            passwordTextField.returnKeyType = .done
            passwordTextField.resignFirstResponder()
        }
        return true
    }
    
}

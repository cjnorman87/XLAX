//
//  LoginController.swift
//  XLAX
//
//  Created by Christopher Norman on 7/10/19.
//  Copyright © 2019 Christopher Norman. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController {
    
    let logoContainerView: UIView = {
        let view = UIView()
        let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Peek"))
        logoImageView.contentMode = .center
        view.addSubview(logoImageView)
        logoImageView.anchor(top: nil, bottom: nil, right: nil, left: nil, paddingTop: 0, paddingBottom: 0, paddingRight: 0, paddingLeft: 0, height: 140, width: 140)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        return view
    }()
    
    let emailTextField: UITextField = {
        let Tf = UITextField()
        Tf.placeholder = "email"
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
        return Tf
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 136, green: 206, blue: 235)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleLogIn), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account? ", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.foregroundColor : UIColor.rgb(red: 136, green: 206, blue: 235)]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        button.isEnabled = true
        return button
    }()
    
    let forgotPassButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot Password", for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        button.setTitleColor(UIColor.rgb(red: 136, green: 206, blue: 235), for: .normal)
        button.addTarget(self, action: #selector(handlePassReset), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        setupLogo()
        setupSignUpButton()
        setupInputFields()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    @objc func handleTextInputChange(){
        let isFormValid = emailTextField.text?.count ?? 0 > 0 && passwordTextField.text?.count ?? 0 > 0
        if isFormValid{
            loginButton.isEnabled = true
            loginButton.backgroundColor = UIColor.rgb(red: 136, green: 206, blue: 235)
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor =  UIColor.rgb(red: 130, green: 225, blue: 235)
        }
    }
    
    @objc func handleLogIn() {
        guard let email = emailTextField.text else { return }
        guard let pass = passwordTextField.text else { return }
        Auth.auth().signIn(withEmail: email, password: pass) { (user, err) in
            
            if let err = err {
                print("Failed to log in user with error: ", err)
                return
            }
            guard let uid = Auth.auth().currentUser?.uid else {return}
            let db = Firestore.firestore()
            db.collection("users").getDocuments{ (qs, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for doc in qs!.documents {
                        let ref = doc.data()
                        print(ref.first)
                    }
                }
            }
            
            
            guard let mainTabBarController = UIApplication.shared.keyWindow?.rootViewController as? MainTabBarViewController else { return }
            mainTabBarController.setupRecTabBar()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func handlePassReset() {
        guard let email = emailTextField.text else { return }
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            print("Your password has been successfully reset")
        }
    }
    
    @objc func handleShowSignUp() {
        let signUpController = SignUpController()
        navigationController?.pushViewController(signUpController, animated: true)
    }
    
    fileprivate func setupSignUpButton() {
        view.addSubview(signUpButton)
        signUpButton.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0), size: CGSize(width: 0, height: 50))
    }
    
    fileprivate func setupLogo() {
        view.addSubview(logoContainerView)
        logoContainerView.anchor(top: view.topAnchor, bottom: nil, right: view.rightAnchor, left: view.leftAnchor, paddingTop: 50, paddingBottom: 0, paddingRight: 0, paddingLeft: 0, height: 150, width: 0)
    }
    
    fileprivate func setupController() {
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
    }
    
    
    fileprivate func setupInputFields() {
        let stackView = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,loginButton, forgotPassButton])
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.anchor(top: logoContainerView.bottomAnchor, bottom: nil, right: view.rightAnchor, left: view.leftAnchor, paddingTop: 50, paddingBottom: 0, paddingRight: 40, paddingLeft: 40, height: 300, width: 0)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}


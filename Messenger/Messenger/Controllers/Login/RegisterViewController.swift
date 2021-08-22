//
//  RegisterViewController.swift
//  Messenger
//
//  Created by Elena Georgieva on 22.05.21.
//

import UIKit

class RegisterViewController: UIViewController {

    private let imageView = UIImageView()
    private let scrollView = UIScrollView()
    private let emailField = UITextField()
    private let passwordField = UITextField()
    private let firstNameField = UITextField()
    private let lastNameField = UITextField()
    private let registerButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Login"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register", style: .done, target: self, action: #selector(didTapRegister))
        
        scrollView.clipsToBounds = true
        scrollView.isUserInteractionEnabled = true
        view.addSubview(scrollView)
        
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        scrollView.addSubview(imageView)
        
        emailField.delegate = self
        emailField.autocapitalizationType = .none
        emailField.autocorrectionType = .no
        emailField.returnKeyType = .continue
        emailField.layer.cornerRadius = 12
        emailField.layer.borderWidth = 2
        emailField.layer.borderColor = UIColor.lightGray.cgColor
        emailField.placeholder = "Email address..."
        emailField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        
        emailField.leftViewMode = .always
        emailField.backgroundColor = .white
        scrollView.addSubview(emailField)
        
        passwordField.delegate = self
        passwordField.autocapitalizationType = .none
        passwordField.autocorrectionType = .no
        passwordField.returnKeyType = .done
        passwordField.layer.cornerRadius = 12
        passwordField.layer.borderWidth = 2
        passwordField.layer.borderColor = UIColor.lightGray.cgColor
        passwordField.placeholder = "Password..."
        passwordField.isSecureTextEntry = true
        passwordField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        
        passwordField.leftViewMode = .always
        passwordField.backgroundColor = .white
        scrollView.addSubview(passwordField)
        
        firstNameField.delegate = self
        firstNameField.autocapitalizationType = .none
        firstNameField.autocorrectionType = .no
        firstNameField.returnKeyType = .continue
        firstNameField.layer.cornerRadius = 12
        firstNameField.layer.borderWidth = 2
        firstNameField.layer.borderColor = UIColor.lightGray.cgColor
        firstNameField.placeholder = "First name..."
        firstNameField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        
        firstNameField.leftViewMode = .always
        firstNameField.backgroundColor = .white
        scrollView.addSubview(firstNameField)
        
        lastNameField.delegate = self
        lastNameField.autocapitalizationType = .none
        lastNameField.autocorrectionType = .no
        lastNameField.returnKeyType = .continue
        lastNameField.layer.cornerRadius = 12
        lastNameField.layer.borderWidth = 2
        lastNameField.layer.borderColor = UIColor.lightGray.cgColor
        lastNameField.placeholder = "Last name..."
        lastNameField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        
        lastNameField.leftViewMode = .always
        lastNameField.backgroundColor = .white
        scrollView.addSubview(lastNameField)
        
        registerButton.setTitle("Register", for: .normal)
        registerButton.backgroundColor = .green
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.cornerRadius = 12
        registerButton.layer.masksToBounds = true
        registerButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        registerButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        scrollView.addSubview(registerButton)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfilePic))
        gesture.numberOfTouchesRequired = 1
        
        imageView.addGestureRecognizer(gesture)
    }

    @objc private func didTapChangeProfilePic() {
        print("Change pic")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds

        let size = scrollView.width/3
        imageView.frame = CGRect(x: (scrollView.width - size)/2, y: 20, width: size, height: size)
        
        firstNameField.frame = CGRect(x: 30, y: imageView.bottom + 10, width: scrollView.width - 60, height: 52)

        lastNameField.frame = CGRect(x: 30, y: firstNameField.bottom + 10, width: scrollView.width - 60, height: 52)

        emailField.frame = CGRect(x: 30, y: lastNameField.bottom + 10, width: scrollView.width - 60, height: 52)
        
        passwordField.frame = CGRect(x: 30, y: emailField.bottom + 10, width: scrollView.width - 60, height: 52)
        
        registerButton.frame = CGRect(x: 30, y: passwordField.bottom + 10, width: scrollView.width - 60, height: 52)


    }
    
    private func allertUserLogginError() {
        let alert = UIAlertController(title: "Woops", message: "Please, enter all information to create a new account.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func loginButtonTapped() {
        emailField.resignFirstResponder()
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = emailField.text, let firstName = firstNameField.text, let lastName = lastNameField.text, let password = passwordField.text, !email.isEmpty, !firstName.isEmpty, !lastName.isEmpty, !password.isEmpty, password.count >= 6 else {
            allertUserLogginError()
            return
        }
        
        //TODO:- login
    }
    
    @objc private func didTapRegister() {
        let vc = RegisterViewController()
        vc.title = "Create account"
        
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            loginButtonTapped()
        }
        
        return true
    }
}

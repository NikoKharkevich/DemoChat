//
//  ViewController.swift
//  DemoChat
//
//  Created by Nikola Kharkevich on 19.01.2022.
//

import UIKit

class AuthViewController: UIViewController {
    
    let signUpVC = SignUpViewController()
    let loginVC = LoginViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
        googleButton.customizeGoogleButton()
        
        emailButton.addTarget(self, action: #selector(emailButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc private func emailButtonTapped() {
        print(#function)
        present(signUpVC, animated: true, completion: nil)
    }
    
    @objc private func loginButtonTapped() {
        print(#function)
        present(loginVC, animated: true, completion: nil)
    }
    
    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Logo"), contentMode: .scaleAspectFit)
    
    let googleLabel = UILabel(text: "Get started with")
    let emailLabel = UILabel(text: "Or sign up with")
    let alreadyOnBoardLabel = UILabel(text: "Already on board")
    
    let googleButton = UIButton(title: "Google", titleColor: .black, backgroudColor: .white, isShadow: true)
    let emailButton = UIButton(title: "Email", titleColor: .white, backgroudColor: .buttonDark(), isShadow: false)
    let loginButton = UIButton(title: "Login", titleColor: .buttonRed(), backgroudColor: .white, isShadow: true)
    
}

// MARK: - Setup Constraints
extension AuthViewController {
    private func setupConstraints() {

        let googleView = ButtonFormView(label: googleLabel, button: googleButton)
        let emailView = ButtonFormView(label: emailLabel, button: emailButton)
        let loginView = ButtonFormView(label: alreadyOnBoardLabel, button: loginButton)
        let stackView = UIStackView(arrangedSubviews: [googleView, emailView, loginView], axis: .vertical, spacing: 40)
        
        view.addSubview(logoImageView)
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
        stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 160),
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - SwiftUI
// Чтобы пользоваться режимом canvas
import SwiftUI

struct AuthViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = AuthViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
    
    
}

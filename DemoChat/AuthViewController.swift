//
//  ViewController.swift
//  DemoChat
//
//  Created by Nikola Kharkevich on 19.01.2022.
//

import UIKit

class AuthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .buttonRed()
    }
    
    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Logo"), contentMode: .scaleAspectFit)
    
    let googleLabel = UILabel(text: "Get started with")
    let emailLabel = UILabel(text: "Or sign up with")
    let alreadyOnBoardLabel = UILabel(text: "Already on board")
    
    let emailButton = UIButton(title: "Email", titleColor: .white, backgroudColor: .buttonDark(), isShadow: false)
    let loginButton = UIButton(title: "Login", titleColor: .buttonRed(), backgroudColor: .white, isShadow: true)
    let googleButton = UIButton(title: "Google", titleColor: .black, backgroudColor: .white, isShadow: true)
    
}

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

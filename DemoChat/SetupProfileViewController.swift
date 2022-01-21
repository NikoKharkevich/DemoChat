//
//  SetupProfileViewController.swift
//  DemoChat
//
//  Created by Nikola Kharkevich on 21.01.2022.
//

import UIKit

class SetupProfileViewController: UIViewController {
    
    let fillIMageView = AddPhotoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupConstraints()
    }
}


// MARK: - Setup Constraints
extension SetupProfileViewController {
    private func setupConstraints() {
        fillIMageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fillIMageView)
        
        NSLayoutConstraint.activate([
            fillIMageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            fillIMageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}


// MARK: - SwiftUI
// Чтобы пользоваться режимом canvas
import SwiftUI

struct SetupProfileViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = SetupProfileViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}

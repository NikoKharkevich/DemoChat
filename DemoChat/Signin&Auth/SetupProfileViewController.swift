//
//  SetupProfileViewController.swift
//  DemoChat
//
//  Created by Nikola Kharkevich on 21.01.2022.
//

import UIKit

class SetupProfileViewController: UIViewController {
    
    let welcomeLabel = UILabel(text: "Set up profile!!", font: .avenir26())
    let fullNameLabel = UILabel(text: "Full name")
    let aboutMeLabel = UILabel(text: "About me")
    let sexLabel = UILabel(text: "Sex")
    
    let fullNameTextField = OneLineTextField(font: .avenir20())
    let aboutMeTextField = OneLineTextField(font: .avenir20())
    let sexSegmentedControl = UISegmentedControl(first: "Male", second: "Female")
    
    let goToChatsButton = UIButton(title: "Got to chats!", titleColor: .white, backgroudColor: .buttonDark(), isShadow: false, cornerRadius: 4)
    
    let fullIMageView = AddPhotoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupConstraints()
    }
}


// MARK: - Setup Constraints
extension SetupProfileViewController {
    private func setupConstraints() {
        
        let fullNameStackView = UIStackView(arrangedSubviews: [fullNameLabel, fullNameTextField],
                                            axis: .vertical, spacing: 0)
        let aboutMeStackView = UIStackView(arrangedSubviews: [aboutMeLabel, aboutMeTextField],
                                           axis: .vertical, spacing: 0)
        let sexStackView = UIStackView(arrangedSubviews: [sexLabel, sexSegmentedControl],
                                       axis: .vertical, spacing: 12)
        
        goToChatsButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        let stackView = UIStackView(arrangedSubviews: [fullNameStackView,
                                                       aboutMeStackView,
                                                       sexStackView,
                                                       goToChatsButton],
                                    axis: .vertical, spacing: 40)

        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        fullIMageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(fullIMageView)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            fullIMageView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 40),
            fullIMageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: fullIMageView.bottomAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
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

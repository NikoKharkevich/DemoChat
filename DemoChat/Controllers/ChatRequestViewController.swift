//
//  ChatRequestViewController.swift
//  DemoChat
//
//  Created by Nikola Kharkevich on 24.01.2022.
//

import UIKit

class ChatRequestViewController: UIViewController {
    
    let containerView = UIView()
    let imageView = UIImageView(image: #imageLiteral(resourceName: "human10"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Jina Jonson", font: .systemFont(ofSize: 20, weight: .light))
    let aboutMeLabel = UILabel(text: "Start new chat", font: .systemFont(ofSize: 16, weight: .light))
    
    let acceptButton = UIButton(title: "Accept", titleColor: .white, backgroudColor: .black, font: .laoSangamMN20(), isShadow: false, cornerRadius: 10)
    let denyButton = UIButton(title: "Deny", titleColor: #colorLiteral(red: 0.8352941176, green: 0.2, blue: 0.2, alpha: 1), backgroudColor: .mainWhite(), font: .laoSangamMN20(), isShadow: false, cornerRadius: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainWhite()
        setupElements()
        setupConstraints()
    }
    
    private func setupElements() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        denyButton.layer.borderColor = #colorLiteral(red: 0.8352941176, green: 0.2, blue: 0.2, alpha: 1)
        denyButton.layer.borderWidth = 1.2
        
        containerView.backgroundColor = .mainWhite()
        containerView.layer.cornerRadius = 30
    }
    
    // когда срабатывает viewDidLoad  у кнопки размеры еще нулевые, поэтому используем этот метод когда layout уже посчитан
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.acceptButton.applyGradients(cornerRadius: 10)
    }
}


extension ChatRequestViewController {
    
    private func setupConstraints() {
        
        view.addSubview(imageView)
        view.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(aboutMeLabel)
        
        let buttonsStackView = UIStackView(arrangedSubviews: [acceptButton, denyButton], axis: .horizontal, spacing: 8)
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // .fillEqually чтобы кнопки были одинаковых размеров
        buttonsStackView.distribution = .fillEqually
        containerView.addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // imageView внизу будет заходить за границу containerView (из-за скругления последнего)
            imageView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 206)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 35),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            aboutMeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            aboutMeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25),
            aboutMeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 25),
            buttonsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25),
            buttonsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -25),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}

// MARK: - SwiftUI
// Чтобы пользоваться режимом canvas
import SwiftUI

struct PChatRequestViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewControllerRepresentable {
        let vc = ChatRequestViewController()
        func makeUIViewController(context: Context) -> some UIViewController {
            return vc
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}

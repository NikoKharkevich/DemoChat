//
//  ActiveChatCell.swift
//  DemoChat
//
//  Created by Nikola Kharkevich on 23.01.2022.
//

import UIKit

class ActiveChatCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseId: String = "ActiveChatCell"
    let friendImageView = UIImageView()
    let friendName = UILabel(text: "User name", font: .laoSangamMN20())
    let lastMessage = UILabel(text: "How are you?", font: .laoSangamMN18())
    let gradientVIew = GradientVIew(from: .topTrailing, to: .bottomLeading, startColor: #colorLiteral(red: 0.7882352941, green: 0.631372549, blue: 0.9411764706, alpha: 1), endColor: #colorLiteral(red: 0.4784313725, green: 0.6980392157, blue: 0.9215686275, alpha: 1))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        backgroundColor = .white
        
        // скругляем углы ячейки
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let chat: MChat = value as? MChat else { return }
        friendImageView.image = UIImage(named: chat.userImageString)
        friendName.text = chat.userName
        lastMessage.text = chat.lastMessage
    }
}


// MARK: - Setup Constraints
extension ActiveChatCell {
    private func setupConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        friendName.translatesAutoresizingMaskIntoConstraints = false
        lastMessage.translatesAutoresizingMaskIntoConstraints = false
        gradientVIew.translatesAutoresizingMaskIntoConstraints = false
        
        friendImageView.backgroundColor = .orange
        gradientVIew.backgroundColor = .black
        
        addSubview(friendImageView)
        addSubview(friendName)
        addSubview(lastMessage)
        addSubview(gradientVIew)
        
        NSLayoutConstraint.activate([
            friendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            friendImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            friendImageView.heightAnchor.constraint(equalToConstant: 78),
            friendImageView.widthAnchor.constraint(equalToConstant: 78)
        ])
        
        NSLayoutConstraint.activate([
            friendName.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            friendName.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16),
            friendName.trailingAnchor.constraint(equalTo: gradientVIew.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
           lastMessage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14),
           lastMessage.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16),
           lastMessage.trailingAnchor.constraint(equalTo: gradientVIew.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            gradientVIew.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            gradientVIew.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            gradientVIew.heightAnchor.constraint(equalToConstant: 78),
            gradientVIew.widthAnchor.constraint(equalToConstant: 8)
        ])
    }
}

// MARK: - SwiftUI
// Чтобы пользоваться режимом canvas
import SwiftUI

struct ActiveChatCellProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = MainTabBarController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}

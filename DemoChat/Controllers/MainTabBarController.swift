//
//  MainTabBarController.swift
//  DemoChat
//
//  Created by Nikola Kharkevich on 22.01.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private let currentUser: MUser
    
    // сделаем дамми дефолтное значение чтобы не исправлять инициализацию в SwiftUI расширении для canvas
    init(currentUser:MUser = MUser(userName: "test",
                                   email: "test",
                                   avatarStringURL: "test",
                                   description: "test",
                                   id: "test",
                                   sex: "test")) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarController()
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
    
    private func setupTabBarController() {
        let listViewController = ListViewController(currentUser: currentUser)
        let peopleViewController = PeopleViewController(currentUser: currentUser)
        
        // толщина рамок изображения
        let boldImageConfiguration = UIImage.SymbolConfiguration(weight: .medium)
        
        tabBar.tintColor = #colorLiteral(red: 0.5568627451, green: 0.3529411765, blue: 0.968627451, alpha: 1)
        let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldImageConfiguration)!
        let conversationImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldImageConfiguration)!
        
        // порядок в массиве имеет значение для отображения
        viewControllers = [
            generateNavigationController(rootViewController: peopleViewController, title: "People", image: peopleImage),
            generateNavigationController(rootViewController: listViewController, title: "Conversations", image: conversationImage)
        ]
    }
    
}

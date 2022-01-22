//
//  MainTabBarController.swift
//  DemoChat
//
//  Created by Nikola Kharkevich on 22.01.2022.
//

import UIKit
import SwiftUI

class MainTabBarController: UITabBarController {
    
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
        let listViewController = ListViewController()
        let peopleViewController = PeopleViewController()
        
        let boldImageConfiguration = UIImage.SymbolConfiguration(weight: .medium)
        
        tabBar.tintColor = #colorLiteral(red: 0.5568627451, green: 0.3529411765, blue: 0.968627451, alpha: 1)
        let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldImageConfiguration)!
        let conversationImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldImageConfiguration)!
        
        viewControllers = [
            generateNavigationController(rootViewController: listViewController, title: "Conversations", image: conversationImage),
            generateNavigationController(rootViewController: peopleViewController, title: "People", image: peopleImage)]
    }
    
}

//
//  ViewController.swift
//  Rick And Morty App
//
//  Created by Felipe Brigagão de Almeida on 10/05/23.
//

import UIKit

final class RMTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        setUpTabs()
    }
    
    private func setUpTabs() {
        let characterVC = RMCharacterViewController()
        let locationVC = RMLocationViewController()
        let episodeVC = RMepisodeViewController()
        let settingsVC = RMSettingsViewController()
        
        characterVC.navigationItem.largeTitleDisplayMode = .automatic
        locationVC.navigationItem.largeTitleDisplayMode = .automatic
        episodeVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let navigation1 = UINavigationController(rootViewController: characterVC)
        let navigation2 = UINavigationController(rootViewController: locationVC)
        let navigation3 = UINavigationController(rootViewController: episodeVC)
        let navigation4 = UINavigationController(rootViewController: settingsVC)
        
        navigation1.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person.3"), tag: 1)
        navigation2.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 2)
        navigation3.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 3)
        navigation4.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)

        for nav in [navigation1, navigation2, navigation3, navigation4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers(
            [navigation1, navigation2, navigation3, navigation4],
            animated: true
        )
    }

}


//
//  ViewController.swift
//  NetflixClone
//
//  Created by naseem on 21/02/2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let viewController1 = UINavigationController(rootViewController: HomeViewController())
    let viewController2 = UINavigationController(rootViewController: UpcomingViewController())
    let viewController3 = UINavigationController(rootViewController: SearchViewController())
    let viewController4 = UINavigationController(rootViewController: DownloadsViewController())
    
    viewController1.tabBarItem.image = AppImage.homeIcon
    viewController2.tabBarItem.image = AppImage.upcomingIcon
    viewController3.tabBarItem.image = AppImage.searchIcon
    viewController4.tabBarItem.image = AppImage.downloadIcon
    
    viewController1.title = AppString.homeTabBarTitle
    viewController2.title = AppString.upcomingTabBarTitle
    viewController3.title = AppString.searchTabBarTitle
    viewController4.title = AppString.downloadTabBarTitle
    
    tabBar.tintColor = .label
    
    setViewControllers([viewController1, viewController2, viewController3, viewController4], animated: true)
  }


}


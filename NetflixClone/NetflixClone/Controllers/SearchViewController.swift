//
//  SearchViewController.swift
//  NetflixClone
//
//  Created by naseem on 22/02/2022.
//

import UIKit

class SearchViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    title = "Top Search"
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.navigationItem.largeTitleDisplayMode = .always
  }
  
  
}

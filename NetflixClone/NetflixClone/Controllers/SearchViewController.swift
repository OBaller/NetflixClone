//
//  SearchViewController.swift
//  NetflixClone
//
//  Created by naseem on 22/02/2022.
//

import UIKit

class SearchViewController: UIViewController {
  
  private var titles: [Title] = [Title]()
  
  private let discoverTable: UITableView = {
    let table = UITableView()
    table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
    return table
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    title = "Search"
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.navigationItem.largeTitleDisplayMode = .always
    
    view.addSubview(discoverTable)
    discoverTable.delegate = self
    discoverTable.dataSource = self
    
    fetchDiscoverMovies()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    discoverTable.frame = view.bounds
  }
  
  func fetchDiscoverMovies() {
    APICaller.shared.getDiscoverMovies { [weak self] result in
      switch result {
        case .success(let titles):
          self?.titles = titles
          DispatchQueue.main.async {
            self?.discoverTable.reloadData()
          }
        case .failure(let error):
          print(error.localizedDescription)
      }
    }
  }
  
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return titles.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
      return UITableViewCell()
    }
    
    let title = titles[indexPath.row]
    let model = TitleViewModel(titleName: title.original_name ?? title.original_title ?? "", posterURL: title.poster_path ?? "")
    cell.configure(with: model)
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 140
  }
}

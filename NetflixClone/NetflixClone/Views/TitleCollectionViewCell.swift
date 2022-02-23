//
//  TitleCollectionViewCell.swift
//  NetflixClone
//
//  Created by naseem on 23/02/2022.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {
    static let identifier = "TitleCollectionViewCell"
  
  private let posterImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.addSubview(posterImageView)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    posterImageView.frame = contentView.bounds
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

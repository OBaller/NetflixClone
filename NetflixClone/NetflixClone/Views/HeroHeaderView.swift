//
//  HeroHeaderView.swift
//  NetflixClone
//
//  Created by naseem on 22/02/2022.
//

import UIKit

class HeroHeaderView: UIView {
  
  private let downloadButton: UIButton = {
    let button = UIButton()
    button.setTitle(AppString.downloadTabBarTitle, for: .normal)
    button.layer.borderColor = UIColor.white.cgColor
    button.layer.borderWidth = 1
    button.layer.cornerRadius = 5
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let playButton: UIButton = {
    let button = UIButton()
    button.setTitle(AppString.playButtonTitle, for: .normal)
    button.layer.borderColor = UIColor.white.cgColor
    button.layer.borderWidth = 1
    button.layer.cornerRadius = 5
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let heroImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = AppImage.heroImage
    return imageView
  }()

  private func addGradient() {
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [
      UIColor.clear.cgColor,
      UIColor.systemBackground.cgColor
    ]
    gradientLayer.frame = bounds
    layer.addSublayer(gradientLayer)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(heroImageView)
    addGradient()
    addSubview(playButton)
    addSubview(downloadButton)
    applyConstraints()
  }
  
  private func applyConstraints() {
    let playButtonConstraints = [
      playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
      playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
      playButton.widthAnchor.constraint(equalToConstant: 110)
    ]
    
    let downloadButtonConstraints = [
      downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
      downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
      downloadButton.widthAnchor.constraint(equalToConstant: 110)
    ]
    
    NSLayoutConstraint.activate(playButtonConstraints)
    NSLayoutConstraint.activate(downloadButtonConstraints)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    heroImageView.frame = bounds
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
//
//  Extensions.swift
//  NetflixClone
//
//  Created by naseem on 23/02/2022.
//

import Foundation

extension String {
  func capitalizeFirstLetter() -> String {
    return self.prefix(1).uppercased() + self.lowercased().dropFirst()
  }
}

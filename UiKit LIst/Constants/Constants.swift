//
//  Constants.swift
//  orderUp
//
//  Created by Kyle  Clutter on 8/18/22.
//

import Foundation
import SwiftUI

enum Constants {
  enum Font {
    public static let underline = CGFloat(3)
    public static let icon = CGFloat(25)
    public static let maxImage = CGFloat(155)
  }

  enum Corner {
    public static let small = CGFloat(8)

    public static let extraLarge = CGFloat(30)
  }

  enum Padding {
    public static let small = CGFloat(5)
  }

  enum Photos {
    public static let salmonPhoto = "salmon"
    public static let hotDogPhoto = "hotDog"
    public static let frenchFryPhoto = "fry"
    public static let saladPhoto = "salad"
    public static let grilledCheesePhoto = "grilledCheese"
    public static let pepsiPhoto = "pepsi"
  }
}

extension Color {
  static let textColor = Color("Text")
  static let blueMain = Color("AppBlue")
  static let blueSecondary = Color("AppBlue1")
  static let grayMain = Color("AppGray")
  static let graySecondary = Color("AppGray2")
  static let grayLight = Color("AppGray3")
  static let menuBoxBackground = Color("MenuBoxBackground")
  static let menuBoxBlue = Color("MenuBoxBlue")
}

//
//  MenuModel.swift
//  orderUp
//
//  Created by Kyle  Clutter on 8/24/22.
//

import Foundation

enum DiscountType: Double, CaseIterable {
  case fivePercent = 0.05
  case tenPercent = 0.10
  case fifteenPercent = 0.15
  case twentyPercent = 0.20
  case twentyFivePercent = 0.25
  case fiftyPercent = 0.50
  case onTheHouse = 1

  static func calculateDiscount(totalAmount: Double, defaultDiscount: DiscountType = .tenPercent) -> Double {
    var amountAfterDiscount = totalAmount - (totalAmount * defaultDiscount.rawValue)

    // I want to return the double with only 2 decimal places
    amountAfterDiscount = (amountAfterDiscount * 100).rounded() / 100

    return amountAfterDiscount
  }
}

enum TipPercentageType: Double, CaseIterable {
  // todo find a workaround for customTip
  case fifteenPercent = 0.15
  case twentyPercent = 0.20
  case twentyFivePercent = 0.25
  case noTip = 0.00

  static func calculateTip(totalAmount: Double, tipPercentage: TipPercentageType = .twentyPercent) -> Double {
    var tipAmount = totalAmount * tipPercentage.rawValue

    // I want to return the double with only 2 decimal places
    tipAmount = (tipAmount * 100).rounded() / 100

    return tipAmount
  }

  static var tipClosure = { (totalAmount: Double, tipPercentage: TipPercentageType) -> Double in
    var tipAmount = totalAmount * tipPercentage.rawValue

    // I want to return the double with only 2 decimal places
    tipAmount = (tipAmount * 100).rounded() / 100

    return tipAmount
  }
}

struct Order {
  var name: String
  var orders: [MenuItem]
  var specialInstructions: String?
  var dineIn = true

  var orderTotal: Double {
    orders.reduce(0.00) { result, menuItem in
      result + menuItem.price
    }
  }

  func calculateOrderTotal() -> Double {
    var total = 0.00

    for order in orders {
      total += order.price
    }
    print(total)
    return total
  }
}

protocol MenuItemProtocol {
  var price: Double { get }
  var description: String { get }
  var title: String { get }
}

struct MenuItem: Hashable, MenuItemProtocol {
  var id = UUID()
  var type: FoodType?
  var price: Double
  var description: String
  var title: String
  var review: Double?
  var size: String?
  var image: String?

  enum FoodType: String {
    case main = "Main Dishes"
    case salad = "Salads"
    case side = "Sides"
    case dessert = "Desserts"
    case drink = "Drinks"
  }
}

#if DEBUG
  extension Order {
    static var sampleData = [
      MenuItem(type: .main, price: 18.99, description: "Salmon grilled to perfection", title: "Grilled Salmon", review: 4.4, image: Constants.Photos.salmonPhoto),
      MenuItem(type: .main, price: 8.9, description: "All Beef Hot Dog", title: "Hot Dog", review: 3.4, image: Constants.Photos.hotDogPhoto),
      MenuItem(type: .drink, price: 3.25, description: "Ice Cold Pepsi", title: "Pepsi", size: "Large", image: Constants.Photos.pepsiPhoto),
      MenuItem(type: .side, price: 4.75, description: "Crispy French Frys", title: "French Frys", review: 5.0, size: "Large", image: Constants.Photos.frenchFryPhoto),
      MenuItem(type: .salad, price: 14.75, description: "Fresh Greek Salad", title: "Greek Salad", review: 4.7, image: Constants.Photos.saladPhoto),
      MenuItem(type: .main, price: 7.95, description: "World Famous Grilled Cheese", title: "Grilled Cheese", review: 5.0, image: Constants.Photos.grilledCheesePhoto),
    ]
  }
#endif

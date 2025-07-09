//
//  ItemType.swift
//  TacoMarket
//
//  Created by Luis Corvalan on 6/24/25.
//

import Foundation

enum ItemType: String, Codable, CaseIterable {
    case banana, eggs, toiletPaper, milk
    case bacon, chicken, taco, tortillas
    case avocado, cheese, lettuce, tomatoes
    case onion, jalapeno, cilantro, lime
    case oliveOil, salt, pepper, coffee
    
    var name: String {
        switch self {
        case .toiletPaper: return "Toilet Paper"
        case .oliveOil: return "Olive Oil"
        default: return rawValue.capitalized
        }
    }
    
    var description: String {
        switch self {
        case .banana, .avocado, .lime: return "Fruits"
        case .lettuce, .tomatoes, .onion, .jalapeno, .cilantro: return "Vegetables"
        case .bacon, .chicken: return "Meat"
        case .milk, .eggs, .cheese: return "Dairy"
        case .tortillas, .taco: return "Mexico"
        case .oliveOil, .salt, .pepper: return "Pantry"
        case .coffee: return "Beverages"
        case .toiletPaper: return "Household"
        }
    }
    
    var price: Double {
        switch self {
        case .banana: return 0.25
        case .eggs: return 2.99
        case .toiletPaper: return 5.49
        case .milk: return 3.29
        case .bacon: return 4.99
        case .chicken: return 6.49
        case .taco: return 1.99
        case .tortillas: return 2.49
        case .avocado: return 1.29
        case .cheese: return 3.99
        case .lettuce: return 1.79
        case .tomatoes: return 0.99
        case .onion: return 0.89
        case .jalapeno: return 0.39
        case .cilantro: return 0.99
        case .lime: return 0.49
        case .oliveOil: return 7.99
        case .salt: return 1.19
        case .pepper: return 2.29
        case .coffee: return 8.49
        }
    }
    
    var startCount: Int {
        switch self {
        case .banana: return 200
        case .eggs: return 60
        case .toiletPaper: return 150
        case .milk: return 80
        case .bacon: return 50
        case .chicken: return 40
        case .taco: return 100
        case .tortillas: return 90
        case .avocado: return 75
        case .cheese: return 60
        case .lettuce: return 70
        case .tomatoes: return 100
        case .onion: return 110
        case .jalapeno: return 95
        case .cilantro: return 85
        case .lime: return 120
        case .oliveOil: return 40
        case .salt: return 100
        case .pepper: return 100
        case .coffee: return 35
        }
    }
}

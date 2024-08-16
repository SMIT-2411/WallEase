//
//  TabBar.swift
//  ARStore
//
//  Created by Smit Patel on 08/08/24.
//

import Foundation

import SwiftUI

enum Tab:String , CaseIterable {
    case home = "Home"
    case cart = "Cart"
    case favourite = "Favourite"
    case profile = "Profile"
    
    var systemImage : String {
        switch self {
        case .home :
            return "house"
            
        case .cart :
            return "cart"
            
        case .favourite :
            return "heart"
            
        case .profile :
            return "person"
        
        }
    }
    var filledImage : String {
        switch self {
        case .home :
            return "house.fill"
        case .cart :
            return "cart.fill"
        case .favourite :
            return "heart.fill"
        case .profile :
            return "person.fill"
        }
    }
    
    var index :Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}

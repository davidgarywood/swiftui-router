//
//  AppDefaults.swift
//  Router
//
//  Created by David.Wood on 19/05/21.
//

import Foundation

enum AppDefaults: String {
    static var defaults = UserDefaults.standard
    
    static let keyPrefix = "com.lightbeamapps.swiftui-router.UserDefaults"
    
    case loggedIn
    case userName
    case hasPresentedOnboarding
    
    private func defaultKey() -> String {
        return AppDefaults.keyPrefix + "." + self.rawValue
    }
    
    func set(_ value: Bool) {
        AppDefaults.defaults.set(value, forKey: self.defaultKey())
    }
    
    func get() -> Bool {
        AppDefaults.defaults.bool(forKey: self.defaultKey())
    }

    func set(_ value: String?) {
        AppDefaults.defaults.set(value, forKey: self.defaultKey())
    }
    
    func get() -> String? {
        AppDefaults.defaults.string(forKey: self.defaultKey())
    }
}

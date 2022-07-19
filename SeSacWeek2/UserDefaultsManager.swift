//
//  UserDefaultsManager.swift
//  SeSacWeek2
//
//  Created by 신동희 on 2022/07/19.
//

import Foundation


@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    
    var wrappedValue: T {
        get { UserDefaults.standard.object(forKey: self.key) as? T ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: self.key) }
    }
}


class UserDefaultManager {
    
    static var shared = UserDefaultManager()
    
    private init() {}
    
    @UserDefault(key: "anniversaryDateKey", defaultValue: Date())
    var anniversaryDateKey: Date
}

//
//  UserDefault.swift
//  oscar.julian_bernat.segura
//
//

import Foundation

let dataKey = "dataKey"
let timeKey = "timeKey"

class OurUserDefaults {
    
    // API
   
    func saveDataToLocal(_ data: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: dataKey)
        userDefaults.set(Date().timeIntervalSince1970, forKey: timeKey)
        userDefaults.synchronize()
    }
    
    func getDataFromLocal() -> String? {
        let userDefaults = UserDefaults.standard
        userDefaults.string(forKey: dataKey)
        
        if let data = userDefaults.object(forKey: dataKey) as? String {
            return data
        }
        return "{}"
    }
    
    func timeTillLastUpdate() -> Double? {
        let userDefaults = UserDefaults.standard
        return userDefaults.object(forKey: timeKey) as? Double
    }
    
    func invalidateData() {
        let userDefaults = UserDefaults.standard
        
        userDefaults.set(0.0, forKey: timeKey)
        userDefaults.removeObject(forKey: timeKey)
        userDefaults.removeObject(forKey: dataKey)
        userDefaults.synchronize()
        print("invalid data")
    }
    
    // CONFIGS
    func saveIntToLocal(_ data: Int, _ key: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: key)
        userDefaults.synchronize()
    }
    
    func getIntFromLocal(_ key: String) -> Int? {
        let userDefaults = UserDefaults.standard
        userDefaults.string(forKey: key)
        
        if let data = userDefaults.object(forKey: key) as? Int {
            return data
        }
        return nil
    }
    
}

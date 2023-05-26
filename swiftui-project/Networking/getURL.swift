//
//  Info.swift
//  swiftui-project
//
//  Created by user238749 on 5/25/23.
//
import Foundation


func getValueFromPlist(withName name: String, forKey key: String) -> Any? {
    if let path = Bundle.main.path(forResource: name, ofType: "plist"),
       let xml = FileManager.default.contents(atPath: path),
       let plistData = try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil) as? [String: Any] {
        return plistData[key]
    } else {
        print("Plist file not found in bundle or invalid format.")
        return nil
    }
}

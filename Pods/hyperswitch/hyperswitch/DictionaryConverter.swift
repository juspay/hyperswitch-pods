//
//  DictionaryConverter.swift
//  hyperswitch
//
//  Created by Balaganesh on 20/12/22.
//

import Foundation

protocol DictionaryConverter {
    func toDictionary() -> [String : Any]
}

extension DictionaryConverter {
    
    func hexStringFromColor(color: UIColor) -> String {
        let cgColorInRGB = color.cgColor.converted(to: CGColorSpace(name: CGColorSpace.sRGB)!, intent: .defaultIntent, options: nil)!
        let colorRef = cgColorInRGB.components
        let r = colorRef?[0] ?? 0
        let g = colorRef?[1] ?? 0
        let b = ((colorRef?.count ?? 0) > 2 ? colorRef?[2] : g) ?? 0
        let a = color.cgColor.alpha
        
        var color = String(
            format: "#%02lX%02lX%02lX",
            lroundf(Float(r * 255)),
            lroundf(Float(g * 255)),
            lroundf(Float(b * 255))
        )
        
        if a < 1 {
            color += String(format: "%02lX", lroundf(Float(a * 255)))
        }
        
        return color
    }
    
    func toDictionary() -> [String : Any] {
        let reflect = Mirror(reflecting: self)
        let children = reflect.children
        let dictionary = toAnyHashable(elements: children)
        return dictionary
    }
    
    func toAnyHashable(elements: AnyCollection<Mirror.Child>) -> [String : Any] {
        var dictionary: [String : Any] = [:]
        for element in elements {
            if let key = element.label {
                
                if let value = element.value as? AnyHashable {
                    if "\(value)" == "nil" {
                        continue
                    }
                }
                
                let isEnumValue = Mirror(reflecting:element.value).displayStyle == .enum
                
                if let collectionValidHashable = element.value as? [AnyHashable] {
                    dictionary[key] = collectionValidHashable
                }
                
                if (isEnumValue) {
                    print("\(key) : \(element)")
                }
                
                if let validHashable = element.value as? AnyHashable {
                    if (isEnumValue) {
                        dictionary[key] = "\(validHashable)"
                    } else {
                        dictionary[key] = validHashable
                    }
                }
                
                if let color = element.value as? UIColor {
                    dictionary[key] = self.hexStringFromColor(color: color)
                }
                
                if let font = element.value as? UIFont {
                    dictionary[key] = font.fontName
                }
                
                if let convertor = element.value as? DictionaryConverter {
                    if (!isEnumValue) {
                        dictionary[key] = convertor.toDictionary()
                    }
                }
                
                if let convertorList = element.value as? [DictionaryConverter] {
                    dictionary[key] = convertorList.map({ e in
                        e.toDictionary()
                    })
                }
            }
        }
        return dictionary
    }
}

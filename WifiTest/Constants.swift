//
//  Constants.swift
//  WifiTest
//
//  Created by Hussein Anwar on 23/09/2022.
//

import UIKit

class Constants {
    enum AppKeys: String {
        case foregroundView         = "foregroundView"
        case numberOfActiveBars     = "numberOfActiveBars"
        case statusBar              = "statusBar"
        case wifiStrengthRaw        = "wifiStrengthRaw"
    }
    
    enum WiFISignalStrength: Int {
        case weak = 0
        case ok = 1
        case veryGood = 2
        case excellent = 3

        func convertBarsToDBM() -> Int {
            switch self {
            case .weak:
                return -90
            case .ok:
                return -70
            case .veryGood:
                return -50
            case .excellent:
                return -30
            }
        }
    }
    
    static func isiPhoneX() -> Bool {
    if UIDevice().userInterfaceIdiom == .phone {
    switch UIScreen.main.nativeBounds.height {
    case 1136:
    //print(“iPhone 5 or 5S or 5C”)
    break
    case 1334:
    //print(“iPhone 6/6S/7/8”)
    break
    case 2208:
    //print(“iPhone 6+/6S+/7+/8+”)
    break
    case 2436:
    //print(“iPhone X”)
    return true
    default:
    break
    //print(“unknown”)
    }
    }
    return false
    }
}

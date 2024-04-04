//
//  DeviceInfo.swift
//  PokeApp
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//


import UIKit

public class DeviceInfo {
    
    // MARK: - Public methods
    
    /// Returns a device ID string if it finds one, if it doesn't find one it returns an empty String
    /// - returns: A String representing the device ID or an empty String ""
    /// - Todo: Maybe we should change the return parameter to String? and let the API consumer decide how to deal with the nil value
    
    public static func deviceId() -> String {
        
        if let vendorId = UIDevice.current.identifierForVendor {
            return vendorId.uuidString
        }
        
        return ""
    }
    
    /// Returns the OS version running on the current device
    /// - Returns: A String representing the current device's OS version, for example "4.0"
    
    public static func osVersion() -> String {
        
        return UIDevice.current.systemVersion
    }
    
    /// Returns the model of the current device
    /// - Returns: A String representing the current device's model, for example "iPhone" or "iPod touch"
    
    public static func model() -> String {
        
        return UIDevice.current.model
    }
    
    /// Checks if the current device is a simulator, or has been jailbreaked. In order to check if it is jailbreaked it checks for a system path that only exists on Jailbreaked devices.
    /// - Returns: A Bool value indicating if the current device it's a physical device which is not jailbreaked.
    
    public static func isJailbreak() -> Bool {
        #if arch(i386) || arch(x86_64)
            // This is a Simulator not an idevice
            return false
        #else
            let fm = FileManager.default
            if(fm.fileExists(atPath: "/private/var/lib/apt")) {
                // This Device is jailbroken
                return true
            } else {
                // Continue the device is not jailbroken
                return false
            }
        #endif
    }
}

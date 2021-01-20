//
//  OnboardingManager.swift
//  OpenTrace


import Foundation

class OnboardingManager {

    static let shared = OnboardingManager()

    func returnCurrentLaunchPage() -> String {
        if !completedIWantToHelp {
            return "intro"
        } else if !hasConsented {
            return "consent"
        } else if !isUserAuthenticated() {
            return "phoneNumber"
        } else if !allowedPermissions || !allowedLocationPermissions {
            return "permissions"
        } else if !completedBluetoothOnboarding {
            return "turnOnBluetooth"
        } else {
            return "main"
        }
    }
}

extension OnboardingManager {

    var completedIWantToHelp: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "completedIWantToHelp")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "completedIWantToHelp")
        }
    }

    var completedBluetoothOnboarding: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "completedBluetoothOnboarding")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "completedBluetoothOnboarding")
        }
    }

    var hasConsented: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "hasConsented")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "hasConsented")
        }
    }

    var allowedPermissions: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "allowedPermissions")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "allowedPermissions")
        }
    }

    var allowedLocationPermissions: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "allowedLocationPermissions")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "allowedLocationPermissions")
        }
    }
}

//MARK: - helper
extension OnboardingManager {
    
    private func isUserAuthenticated() -> Bool {
        if let userid = UserDefaults.standard.string(forKey: userDefaultsPinKey),
            userid.count > 0  {
            return true
        } else {
            return false
        }
    }
}

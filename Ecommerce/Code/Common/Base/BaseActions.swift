//
//  BaseActions.swift
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//

import Foundation
import UIKit
import MapKit
import SafariServices
import SwiftUI
import AVFoundation

final class BaseActions {

    static func openWebUrl(_ url: URL) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    static func openWebUrl(_ url: String) {
        if let url = URL(string: url) {
            openWebUrl(url)
        }
    }

    static func call(phoneNumber: String) {
        openWebUrl("tel://\(phoneNumber.removeWhitespaces)")
    }

    static func sendEmail(email: String) {
        openWebUrl("mailto:\(email)")
    }

    static func goToGoogleMaps(latitude: String, longitude: String) {
        if hasGoogleMaps() {
            openWebUrl("comgooglemaps://?saddr=&daddr=\(latitude),\(longitude)&directionsmode=driving")
        }
    }

    static func goToGoogleWaze(latitude: String, longitude: String) {
        if hasWaze() {
            openWebUrl("waze://?ll=\(latitude),\(longitude)&navigate=yes")
        }
    }

    static func goToMapas(latitude: Double, longitude: Double, name: String) {
        let placemark = MKPlacemark(coordinate: CLLocationCoordinate2DMake(latitude, longitude), addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = name
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
    }

    static func hasWaze() -> Bool {
        return UIApplication.shared.canOpenURL(URL(string: "waze://")!)
    }

    static func hasGoogleMaps() -> Bool {
        return UIApplication.shared.canOpenURL(URL(string: "comgooglemaps://")!)
    }

    static func hasMapas() -> Bool {
        return UIApplication.shared.canOpenURL(URL(string: "maps://")!)
    }

    static func share(text: String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate

        if let rootVc = appDelegate?.window?.rootViewController {
            let activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = rootVc.view
            rootVc.present(activityViewController, animated: true, completion: nil)
        }
    }

    static func shareData(data: NSData) {

        var rootVc: UIViewController?

        if let nav = UIApplication.shared.keyWindow?.rootViewController?.presentedViewController as? UINavigationController {

            rootVc = nav
        } else {
            let appDelegate = UIApplication.shared.delegate as? AppDelegate

            rootVc = appDelegate?.window?.rootViewController
        }

        if let rootVc = rootVc {
            let activityViewController = UIActivityViewController(activityItems: [data], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = rootVc.view
            rootVc.present(activityViewController, animated: true, completion: nil)
        }
    }

    static func openSafari(_ url: URL) {
        let safariController = SFSafariViewController(url: url)
        safariController.modalPresentationStyle = .fullScreen
        
        // MARK: - Cambiar color
        safariController.preferredControlTintColor = UIColor(Color.blue)

        var rootVc: UIViewController?

        if let nav = UIApplication.shared.keyWindow?.rootViewController?.presentedViewController as? UINavigationController {
            rootVc = nav
        } else {
            rootVc = (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController
        }

        rootVc?.present(safariController, animated: true, completion: nil)
    }

    static func openSafari(_ url: String) {
        if let url = URL(string: url) {
            openSafari(url)
        }
    }

    static func openToAppSettings() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString),
               UIApplication.shared.canOpenURL(settingsUrl) else {
             return
         }

         UIApplication.shared.open(settingsUrl)
    }

    static func requestCameraPermission(granted: @escaping() -> Void, denied: @escaping() -> Void) {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized: granted()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { value in
                if value {
                    DispatchQueue.main.async {
                        granted()
                    }
                }
            }
        case .denied: denied()
        case .restricted: denied()
        @unknown default: denied()
        }
    }
}


//
//  VoidModel.swift
//  testSwiftUI
//
//  Created by Chen Cen on 10/10/23.
//

import Foundation
import SwiftUI
import StripeIdentity
import UIKit

class ViewModel: ObservableObject {
    let verficationSheet: IdentityVerificationSheet = IdentityVerificationSheet(
        verificationSessionId: "vs_1234",
        ephemeralKeySecret: "ek_live_1234",
        configuration: IdentityVerificationSheet.Configuration(brandLogo: UIImage(named: "stripe")!)
    )
    
    private func getViewContorller() -> UIViewController? {
        let allScenes = UIApplication.shared.connectedScenes
        for scene in allScenes {
            guard let windowScene = scene as? UIWindowScene else { continue }
            for window in windowScene.windows where window.rootViewController != nil {
                return window.rootViewController!
            }
        }
        return nil
    }
    
    func present() {
        if let vc = getViewContorller() {
            verficationSheet.present(from: vc) { callback in
                print("callback: \(callback)")
            }
        } else {
            print("can't get VC")
        }
    }
}

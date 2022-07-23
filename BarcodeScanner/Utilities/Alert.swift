//
//  Alert.swift
//  BarcodeScanner
//
//  Created by Alexander James Cooper on 23/07/2022.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input",
                                              message: "Something is wrong with the camera, we are unable to capture the input.",
                                              dismissButton: .default(Text("Ok")))
    
    static let invalidScannedValue = AlertItem(title: "Invalid Scanned Type",
                                               message: "Value scanned was not valid, we can scan EAN-8 & EAN-13 barcode types.",
                                               dismissButton: .default(Text("Ok")))
}

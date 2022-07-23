//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Alexander James Cooper on 23/07/2022.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
        /// Stub empty implementation.
    }
    
    func makeCoordinator() -> ScannerCoordinator  {
        return ScannerCoordinator(scannerView: self)
    }
    
    //MARK: Creating Coordinator
    final class ScannerCoordinator: NSObject, ScannerVCDelegate {
        
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
        }
        
        func didSurfaceError(error: CameraError) {
            switch error {
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue:
                scannerView.alertItem = AlertContext.invalidScannedValue
            }
        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView(scannedCode: .constant("10264643614"), alertItem: .constant(AlertItem(title: "Test", message: "Test message", dismissButton: .default(Text("Ok")))))
    }
}

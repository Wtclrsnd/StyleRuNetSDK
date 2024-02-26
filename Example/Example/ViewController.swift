//
//  ViewController.swift
//  Example
//
//  Created by Nika on 2/10/24.
//

import UIKit
import StyleRuNetSDK

class ViewController: UIViewController, SRNSessionDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNetworkSession()
    }
    
    private func setupNetworkSession() {
        SRNSession.shared.delegate = self
        
        if let url = URL(string: "https://example.com/api/data") {
            SRNSession.shared.createDataTask(with: url)
        }
    }
    
    func srnSession(didReceiveData data: Data, response: URLResponse) {
        DispatchQueue.main.async {
            if let stringData = String(data: data, encoding: .utf8) {
                self.displayDataOnUI(stringData)
            }
        }
    }
    
    func srnSession(didCompleteWithError error: Error?) {
        DispatchQueue.main.async {
            if let error = error {
                self.displayErrorOnUI(error.localizedDescription)
            } else {
                print("Success!")
            }
        }
    }
    
    private func displayDataOnUI(_ data: String) {
        print("\(data)")
    }
    
    private func displayErrorOnUI(_ errorMessage: String) {
        print("Error: \(errorMessage)")
    }
}

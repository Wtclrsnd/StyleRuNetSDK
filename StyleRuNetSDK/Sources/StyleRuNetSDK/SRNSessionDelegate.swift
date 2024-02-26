import Foundation

public protocol SRNSessionDelegate: AnyObject { // протокол s
    func srnSession(didReceiveData data: Data, response: URLResponse)
    func srnSession(didCompleteWithError error: Error?)
}

extension SRNSessionDelegate {
    func srnSession(didReceiveData data: Data, response: URLResponse) {
        print("Received data: \(data), response: \(response)")
    }

    func srnSession(didCompleteWithError error: Error?) {
        if let error = error {
            print("Session completed with error: \(error)")
        } else {
            print("Session completed without errors.")
        }
    }
}

//// https://docs.swift.org/swift-book
//
////public final class a {
////    public static func printLetter() {
////        print("aaaa")
////    }
////}
//
//import Foundation
//
//public protocol s: AnyObject {  // URLSession events
//    func srnSession(didReceiveData data: Data, response: URLResponse)
//    func srnSession(didCompleteWithError error: Error?)
//}
//
//
//public class SRNSession: NSObject, URLSessionDelegate {    // creating and starting URLSession tasks and forwarding the events to the delegate
//    public static let shared = SRNSession()    // singleton
//    
//    public var delegate: s?
//    
//    private lazy var session: URLSession = {
//            let configuration = URLSessionConfiguration.default
//            return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
//        }()
//    
//    public override init() {
//        super.init()
//    }
//    
//    public func createDataTask(with url: URL) {
//        let task = session.dataTask(with: url)
//        task.resume()
//    }
//}
//
//
//// delegate methods of URLSession
//extension SRNSession: URLSessionDataDelegate {
//    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
//        delegate?.srnSession(didReceiveData: data, response: dataTask.response!)
//    }
//}
//
//extension SRNSession: URLSessionTaskDelegate {
//    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
//        delegate?.srnSession(didCompleteWithError: error)
//    }
//}
//

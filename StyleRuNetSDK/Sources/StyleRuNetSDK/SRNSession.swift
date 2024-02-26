import Foundation

// creating and starting URLSession tasks and forwarding the events to the delegate/
public class SRNSession: NSObject, URLSessionDelegate, URLSessionDataDelegate, URLSessionTaskDelegate {
    public static let shared = SRNSession()  // singleton
    
    public var delegate: s? 
    
    private lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }()
    
    public init(config: SRNSessionConfig = SRNSessionConfig.defaultConfig()) {
            super.init()
            let urlSessionConfig = config.toURLSessionConfiguration()
            self.session = URLSession(configuration: urlSessionConfig, delegate: self, delegateQueue: nil)
        }
    
    public func createDataTask(with url: URL) {
        let task = session.dataTask(with: url)
        task.resume() 
    }
}

// delegate methods of URLSession
extension SRNSession: URLSessionDataDelegate {
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        delegate?.srnSession(didReceiveData: data, response: dataTask.response!)
    }
}

extension SRNSession: URLSessionTaskDelegate {
    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        delegate?.srnSession(didCompleteWithError: error)
    }
}

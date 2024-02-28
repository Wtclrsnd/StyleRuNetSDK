import Foundation

public class SRNSession: NSObject {
    public static let shared = SRNSession()  // синглтон
    
    public var delegate: SRNSessionDelegate?
    private var session: URLSession!
    
    public init(config: SRNSessionConfig = SRNSessionConfig.defaultConfig()) {
        super.init()
        let urlSessionConfig = config.toURLSessionConfiguration()
        //перенесла сюда
        self.session = URLSession(configuration: urlSessionConfig, delegate: self, delegateQueue: nil)
    }
    
    public func createDataTask(with url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = session.dataTask(with: url) { data, response, error in
            completion(data, response, error)
        }
        task.resume()
    }

}

extension SRNSession: URLSessionDataDelegate {
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        if let response = dataTask.response {
            delegate?.srnSession(didReceiveData: data, response: response)
        } else {
            // nil
            print("Ответ не получен")
        }
    }
}


extension SRNSession: URLSessionTaskDelegate {
    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        delegate?.srnSession(didCompleteWithError: error)
    }
}

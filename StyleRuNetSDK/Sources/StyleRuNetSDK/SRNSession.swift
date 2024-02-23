import Foundation

class SRNSession {
    // MARK: - Properties
    
    static let shared = SRNSession()
    private let session: URLSession
    
    // MARK: - Initialization
    
    private init() {
        let configuration = URLSessionConfiguration.default
        session = URLSession(configuration: configuration)
    }
    
    // MARK: - Public Methods
    
    // Creates a data task with the given request and returns it
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return session.dataTask(with: request, completionHandler: completionHandler)
    }
    
    // Creates a data task with the given URL and returns it
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return session.dataTask(with: url, completionHandler: completionHandler)
    }
}

